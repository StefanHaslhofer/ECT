from qiskit import QuantumCircuit
from qiskit.converters import circuit_to_dag
from qiskit.transpiler import CouplingMap

# coupling of a brooklyn device as a list representation
coupling = [[0, 1], [1, 2], [2, 3]]


# based on algorithms described in https://pypi.org/project/quantum-qubit-mapping/
def q_transpile(c):
    qc_transpiled = QuantumCircuit(len(c.qubits), len(c.qubits))

    front_layer = ""  # TODO search for a way to get the first independent CNOT gates in dag
    coupling_map = CouplingMap(couplinglist=coupling)

    mapping = initiate_mapping(ghz)
    # initiate the circuits directed acyclic graph (dag)
    dag = circuit_to_dag(ghz)

    # mapping = sabre_swap(,mapping,,dag,coupling_map)
    return qc_transpiled


def sabre_swap(front_layer, mapping, dm, dag, coupling_graph):
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
ghz.cx(0, range(1, 3))
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
