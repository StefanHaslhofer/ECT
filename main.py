from qiskit import QuantumCircuit
from qiskit.circuit.library import SwapGate
from qiskit.converters import circuit_to_dag
from qiskit.dagcircuit import DAGCircuit, DAGOpNode
from qiskit.transpiler import CouplingMap
from qiskit.transpiler import Layout
from copy import copy, deepcopy

# coupling of a brooklyn device as a list representation
coupling = [[0, 1], [1, 2], [2, 3]]


# algorithm was inspired by
# Gushu Li, Yufei Ding, Yuan Xie, “Tackling the Qubit Mapping Problem for NISQ-Era Quantum Devices,” https://pypi.org/project/quantum-qubit-mapping/, pp. 4–7, 2019
def q_transpile(c):
    qc_transpiled = QuantumCircuit(len(c.qubits), len(c.qubits))

    coupling_map = CouplingMap(couplinglist=coupling)

    # initiate the circuits directed acyclic graph (dag)
    dag = circuit_to_dag(ghz)

    # get the initial layout from the dag
    layout = Layout.generate_trivial_layout(dag.qregs["q"])
    front_layer = dag.front_layer()

    mapping = sabre_swap(front_layer, layout, dag, coupling_map)
    return qc_transpiled


# returns true if gate is a one-qubit-gate or its two qubits are connected
def qubits_connected(gate, coupling_graph, layout):
    return len(gate.qargs) == 1 or coupling_graph.graph.has_edge(
        layout._v2p[gate.qargs[0]], layout._v2p[gate.qargs[1]]
    )


# search for indizes of all possible swaps
def optain_swaps(front_layer, coupling_graph):
    swaps = []
    # iterate over all neighbours of gates referenced in the front-layer
    for gate in front_layer:
        for qubit in gate.qargs:
            # get
            for i, n in enumerate(coupling_graph.distance_matrix[qubit.index]):
                # swap possible if distance is 1
                if n == 1:
                    swaps.append({'q1': qubit.index, 'q2': i, 'gate': gate})

    return swaps


# calculate the cumulative distance between all elements of the front layer and their successors after the swap
def calc_swap_score(swap, layout, coupling_graph):
    return 1  # TODO implement heurisitic

def sabre_swap(front_layer, layout, dag, coupling_graph):
    executed_gates = []
    # generate new DAG based on the present structure
    new_dag = dag._copy_circuit_metadata()

    # iterate until no gates are left to execute
    # gates in the front_layer do not have any dependencies on other previous gates
    while front_layer:
        execute_gate_list = []
        # mark all gates that can be executed (I.e. all gates that are in the front layer)
        for fg in front_layer:
            # execute gate if qubits are neighbours
            if qubits_connected(fg, coupling_graph, layout):
                execute_gate_list.append(fg)

        if execute_gate_list:
            for gate in execute_gate_list:
                # remove executed gates
                new_dag.apply_operation_back(gate.op, gate.qargs, gate.cargs)
                front_layer.remove(gate)
                executed_gates.append(gate)
                # iterate over successors and check if dependencies are resolved
                # if so add them to the front layer as they are ready for execution
                # filter by name=cx: due to specification only care about cnot
                for succ in list(filter(lambda s: s.name == 'cx', dag.successors(gate))):
                    preds = list(filter(lambda s: s.name == 'cx', dag.predecessors(succ)))
                    # only add the successor-element to the front-layer if all its predecessors were already executed
                    if set(preds).issubset(executed_gates):
                        front_layer.append(succ)
        # swap bits if nothing can be executed
        else:
            score = []

            # obtain all possible swaps and their score based on a heuristic
            for swap in optain_swaps(front_layer, coupling_graph):
                score.append({'op': swap, 'score': calc_swap_score(swap, layout, coupling_graph)})

            # chose the swap action with the minimal score
            min_swap = min(score, key=lambda s: s['score'])['op']
            swap_node = DAGOpNode(op=SwapGate(), qargs=min_swap['gate'].qargs)
            new_dag.apply_operation_back(swap_node.op, swap_node.qargs, swap_node.cargs)
            new_dag.draw(scale=0.7, filename=None, style='color')
            # swap logical bits
            layout.swap(min_swap['q1'], min_swap['q2'])

    return layout


#####path = './original/ghz_state-5.qasm'
#####qc = QuantumCircuit.from_qasm_file(path=path)

ghz = QuantumCircuit(4, 4)
ghz.h(0)
ghz.cx(0, 1)
ghz.cx(1, 2)
ghz.cx(0, 3)
ghz.barrier()
ghz.measure(range(3), range(3))
print(ghz.draw(output='text'))

qc_transpiled = q_transpile(ghz)
print(qc_transpiled.draw(output='text'))

##### print(qc.draw(output='text'))
#####
##### circ = QuantumCircuit(3)
##### circ.ccx(0, 1, 2)
#####
##### print(circ.draw(output='text'))
#####
##### qc_transpiled = transpile(qc, backend=FakeBrooklyn())
##### filename = './mapped/ghz_state-5.qasm'
##### qc_transpiled.qasm(filename=filename)
