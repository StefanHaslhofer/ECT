from qiskit import QuantumCircuit, transpile
from qiskit.dagcircuit import DAGCircuit
from qiskit.test.mock.backends import FakeBrooklyn
from qiskit.converters import circuit_to_dag

# based on algorithms described in https://pypi.org/project/quantum-qubit-mapping/
def q_transpile(c):
    qc_transpiled = QuantumCircuit(c.qregs[0].size, c.cregs[0].size)

    return qc_transpiled


def sabre_swap(front_layer, mapping, dm, dag, coupling_graph):
    return ""

# map => <physical Q-bit>:<logical Q-bit>
# 1 to 1 initial mapping
def initiateMapping(c):
    mapping = {}
    for i in range(c.qregs[0].size):
        mapping['Q_' + str(i)] = 'q_' + str(i)

    return mapping


path = './original/ghz_state-5.qasm'
qc = QuantumCircuit.from_qasm_file(path=path)

ghz = QuantumCircuit(3, 3)
ghz.h(0)
ghz.cx(0, range(1, 3))
ghz.barrier()
ghz.measure(range(3), range(3))
print(ghz.draw(output='text'))

mapping = initiateMapping(ghz)
# initiate the circuits directed acyclic graph (dag)
dag = circuit_to_dag(ghz)

qc_transpiled = q_transpile(ghz)
print(qc_transpiled.draw(output='text'))

# print(qc.draw(output='text'))
#
# circ = QuantumCircuit(3)
# circ.ccx(0, 1, 2)
#
# print(circ.draw(output='text'))
#
# qc_transpiled = transpile(qc, backend=FakeBrooklyn())
# filename = './mapped/ghz_state-5.qasm'
# qc_transpiled.qasm(filename=filename)
