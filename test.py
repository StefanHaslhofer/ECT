from qiskit import QuantumCircuit, transpile
from qiskit.test.mock.backends import FakeBrooklyn

def get_circuit_cost(qc: QuantumCircuit) -> int:
    instructions = [i[0] for i in qc]
    cost = 0
    for i, inst in enumerate(instructions):
        if inst.name == 'sx' or inst.name == 'x':
            cost += 1
        elif inst.name == 'cx':
            cost += 10
        elif inst.name == 'swap':
            cost += 30
            print('a')
        elif (inst.name != 'rz' and inst.name != 'measure' and inst.name != 'barrier'):
            print(f"{i}th instruction '{inst.name}' not allowed")
    return cost

path = './original/adder-3.qasm'
qc = QuantumCircuit.from_qasm_file(path=path)
qc_transpiled = transpile(qc, backend=FakeBrooklyn(), routing_method='basic', layout_method='trivial')
qc_transpiled2 = transpile(qc, backend=FakeBrooklyn(), routing_method='sabre', layout_method='sabre')
filename = './mapped/adder-3.qasm'
filename2 = './mapped/adder-3v2.qasm'
qc_transpiled.qasm(filename=filename)
qc_transpiled2.qasm(filename=filename2)

print(get_circuit_cost(qc_transpiled))
print(get_circuit_cost(qc_transpiled2))