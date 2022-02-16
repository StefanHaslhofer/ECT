from qiskit import QuantumCircuit, transpile
from qiskit.test.mock.backends import FakeBrooklyn

# based on algorithms described in https://pypi.org/project/quantum-qubit-mapping/
def q_transpile(q_circuit):
    qc_transpiled = QuantumCircuit(3, 3)

    return qc_transpiled

path = './original/ghz_state-5.qasm'
qc = QuantumCircuit.from_qasm_file(path=path)

ghz = QuantumCircuit(3, 3)
ghz.h(0)
ghz.cx(0, range(1, 3))
ghz.barrier()
ghz.measure(range(3), range(3))
print(ghz.draw(output='text'))

qc_transpiled = q_transpile(ghz)
print(qc_transpiled.draw(output='text'))

#print(qc.draw(output='text'))
#
#circ = QuantumCircuit(3)
#circ.ccx(0, 1, 2)
#
#print(circ.draw(output='text'))
#
#qc_transpiled = transpile(qc, backend=FakeBrooklyn())
#filename = './mapped/ghz_state-5.qasm'
#qc_transpiled.qasm(filename=filename)