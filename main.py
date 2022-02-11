from qiskit import QuantumCircuit, transpile
from qiskit.test.mock.backends import FakeBrooklyn

path = './emtec21/benchmarks/original/circuit.qasm'
qc = QuantumCircuit.from_qasm_file(path=path)
qc_transpiled = transpile(qc, backend=FakeBrooklyn())
filename = './emtec21/benchmarks/mapped/circuit.qasm'
qc_transpiled.qasm(filename=filename)