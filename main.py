from qiskit import QuantumCircuit
from qiskit.converters import circuit_to_dag
from qiskit.transpiler import PassManager, CouplingMap
from sabre import Sabre

# coupling of a brooklyn device as a list representation
coupling = [[0, 1], [1, 2], [2, 3]]

#####path = './original/ghz_state-5.qasm'
#####qc = QuantumCircuit.from_qasm_file(path=path)

pm = PassManager()

qc = QuantumCircuit(4, 4)
qc.h(0)
qc.cx(0, 1)
qc.cx(1, 2)
qc.cx(0, 3)
qc.barrier()
qc.measure(range(3), range(3))
print(qc.draw(output='text'))

coupling_map = CouplingMap(couplinglist=coupling)
pm.append([Sabre(coupling_map)])

qc_transpiled = pm.run(qc)
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
