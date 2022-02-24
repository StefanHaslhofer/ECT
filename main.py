from qiskit import QuantumCircuit
from qiskit.circuit.library import SwapGate
from qiskit.converters import circuit_to_dag
from qiskit.dagcircuit import DAGCircuit
from qiskit.transpiler import CouplingMap
from qiskit.transpiler import Layout

# coupling of a brooklyn device as a list representation
coupling = [[0, 1], [1, 2], [2, 3]]


# map => <physical Q-bit>:<logical Q-bit>
# 1 to 1 initial mapping
def initiate_mapping(c):
    mapping = {}
    for i in range(len(c.qubits)):
        mapping['Q_' + str(i)] = 'q_' + str(i)

    return mapping


# algorithm was inspired by
# [1] Gushu Li, Yufei Ding, Yuan Xie, “Tackling the Qubit Mapping Problem for NISQ-Era Quantum Devices,” https://pypi.org/project/quantum-qubit-mapping/, pp. 4–7, 2019
def q_transpile(c):
    qc_transpiled = QuantumCircuit(len(c.qubits), len(c.qubits))

    coupling_map = CouplingMap(couplinglist=coupling)

    mapping = initiate_mapping(ghz)
    # initiate the circuits directed acyclic graph (dag)
    dag = circuit_to_dag(ghz)
    front_layer = dag.front_layer()

    mapping = sabre_swap(front_layer, mapping, dag, coupling_map)
    return qc_transpiled


# returns true if gate is a one-qubit-gate or its two qubits are connected
def qubits_connected(gate, coupling_graph):
    return len(gate.qargs) == 1 or coupling_graph.distance(gate.qargs[0].index, gate.qargs[1].index) == 1


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
                    swaps.append((qubit.index, i, gate))

    return swaps


# calculate the cumulative distance between all elements of the front layer and their successors after the swap
def calc_swap_score(swap, mapping, coupling_graph):
    return 1  # TODO implement heurisitic


def swap_qubits(dag, swap):
    # create a copy of the dag
    new_dag = DAGCircuit()
    for qreg in dag.qregs.values():
        new_dag.add_qreg(qreg)
    for creg in dag.cregs.values():
        new_dag.add_creg(creg)

    # generate a copy of out current layout
    current_layout = Layout.generate_trivial_layout(dag.qregs['q']).copy()

    # iterate over all layers
    for layer in dag.serial_layers():
        subdag = layer['graph']

        # create empty dag that will get merged with the copy of the original one
        swap_layer = DAGCircuit()
        swap_layer.add_qreg(dag.qregs['q'])

        # TODO this check does not work yet
        # apply swap if gate that needs the swap is in the current layer
        if swap[2] in subdag.op_nodes():
            swap_layer.apply_operation_back(SwapGate(),
                                            qargs=[current_layout[swap[0]], current_layout[swap[1]]],
                                            cargs=[])

            # insert swap into new dag
            order = current_layout.reorder_bits(new_dag.qubits)
            new_dag.compose(swap_layer, qubits=order)

            # insert swap into layout
            current_layout.swap(swap[0], swap[1])

        # insert old layer into the new data
        order = current_layout.reorder_bits(new_dag.qubits)
        new_dag.compose(subdag, qubits=order)

    return new_dag
    # swap_layer.add_qreg(canonical_register)


def sabre_swap(front_layer, mapping, dag, coupling_graph):
    executed_gates = []

    # iterate until no gates are left to execute
    # gates in the front_layer do not have any dependencies on other previous gates
    while front_layer:
        execute_gate_list = []
        # mark all gates that can be executed (I.e. all gates that are in the front layer)
        for fg in front_layer:
            # execute gate if qubits are neighbours
            if qubits_connected(fg, coupling_graph):
                execute_gate_list.append(fg)

        if execute_gate_list:
            for gate in execute_gate_list:
                # remove executed gates
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

            for swap in optain_swaps(front_layer, coupling_graph):
                score.append((swap, calc_swap_score(swap, mapping, coupling_graph)))

            min_swap = min(score, key=lambda s: s[1])
            dag = swap_qubits(dag, min_swap[0])
            # TODO implement swap

    return mapping


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
