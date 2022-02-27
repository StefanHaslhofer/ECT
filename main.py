from qiskit import QuantumCircuit, QuantumRegister
from qiskit.converters import circuit_to_dag
from qiskit.transpiler import PassManager, CouplingMap
from sabre import Sabre

# coupling of a brooklyn device as a list representation
coupling = [[0, 1], [1, 2], [2, 3], [3, 4], [4, 5], [5, 6]]

#####path = './original/ghz_state-5.qasm'
#####qc = QuantumCircuit.from_qasm_file(path=path)

pm = PassManager()

q = QuantumRegister(7, 'q')
in_circ = QuantumCircuit(q)
in_circ.h(q[0])
in_circ.cx(q[0], q[4])
in_circ.cx(q[2], q[3])
in_circ.cx(q[6], q[1])
in_circ.cx(q[5], q[0])
in_circ.cx(q[5], q[0])
print(in_circ.draw(output='text'))

coupling_map = CouplingMap(couplinglist=coupling)
pm.append([Sabre(coupling_map)])

qc_transpiled = pm.run(in_circ)
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
