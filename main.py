from qiskit import QuantumCircuit
from qiskit.converters import circuit_to_dag
from qiskit.transpiler import CouplingMap

# coupling of a brooklyn device as a list representation
coupling = [[0, 1], [1, 2], [2, 3]]


# algorithm was inspired by
# [1] Gushu Li, Yufei Ding, Yuan Xie, “Tackling the Qubit Mapping Problem for NISQ-Era Quantum Devices,” https://pypi.org/project/quantum-qubit-mapping/, pp. 4–7, 2019
def q_transpile(c):
    qc_transpiled = QuantumCircuit(len(c.qubits), len(c.qubits))

    coupling_map = CouplingMap(couplinglist=coupling)

    mapping = initiate_mapping(ghz)
    # initiate the circuits directed acyclic graph (dag)
    dag = circuit_to_dag(ghz)
    front_layer = dag.front_layer()

    mapping = sabre_swap(front_layer, [], mapping, dag, coupling_map)
    return qc_transpiled

def optain_swaps(front_layer, coupling_graph):
    return ""

# returns true if gate is either a one-qubit-gate or its two qubits are connected
def qubits_connected(gate, distance_matrix):
    return len(gate.qargs) == 1 or distance_matrix[gate.qargs[0].index][gate.qargs[1].index] == 1

def sabre_swap(front_layer, executed_gates, mapping, dag, coupling_graph):
    # iterate until no gates are left to execute
    # gates in the front_layer do not have any dependencies on other previous gates
    while front_layer:
        execute_gate_list = []
        # mark all gates that can be executed (I.e. all gates that are in the front layer)
        for fg in front_layer:
            # execute gate if qubits are neighbours
            if qubits_connected(fg, coupling_graph.distance_matrix):
                execute_gate_list.append(fg)



        if execute_gate_list:
            for gate in execute_gate_list:
                # remove executed gates
                front_layer.remove(gate)
                executed_gates.append(gate)
                # iterate over successors and check if dependencies are resolved
                # if so add them to the front layer as they are ready for execution
                for succ in dag.successors(gate):
                    preds = []
                    for pred in dag.predecessors(succ):
                        preds.append(pred)
                    # TODO error empty predecesor is also added
                    # only add the successor-element to the front-layer if all its predecessors were already executed
                    if all(g in dag.predecessors(succ) for g in executed_gates):
                        front_layer.append(succ)
        # swap bits if nothing can be executed
        else:
            score = []
            swap_candidates = optain_swaps(front_layer, coupling_graph)

    return mapping


# distances between two physical bits
def get_distance_matrix(c):
    dm = []
    for i in range(len(c.qubits)):
        col = []
        for j in range(len(c.qubits)):
            col.append(0)
        dm.append(col)

    return dm


# map => <physical Q-bit>:<logical Q-bit>
# 1 to 1 initial mapping
def initiate_mapping(c):
    mapping = {}
    for i in range(len(c.qubits)):
        mapping['Q_' + str(i)] = 'q_' + str(i)

    return mapping


#####path = './original/ghz_state-5.qasm'
#####qc = QuantumCircuit.from_qasm_file(path=path)

ghz = QuantumCircuit(3, 3)
ghz.h(0)
ghz.cx(0, 1)
ghz.cx(1, 2)
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
