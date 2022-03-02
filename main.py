import os

from qiskit import QuantumCircuit, QuantumRegister, transpile, ClassicalRegister
from qiskit.transpiler import PassManager, CouplingMap, Layout
from qiskit.converters import circuit_to_dag, dag_to_circuit
from sabre import Sabre
from qiskit.test.mock.backends import FakeBrooklyn


# author: Elias Foramitti
def get_layout_description_comment(layout, dag):
    physical_qbits = []
    virtual_bit_mapping = layout.get_virtual_bits()
    # one could directly take layout.get_virtual_bits().values(),
    # but that would not necessarily preserve the original ordering
    # of virtual qubits resulting in a wrong layout description
    for qreg in dag.qregs.values():
        for qbit in qreg:
            physical_qbits.append(virtual_bit_mapping[qbit])
    return '// i ' + ' '.join(str(i) for i in physical_qbits)


# author: Elias Foramitti
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
        elif (inst.name != 'rz' and inst.name != 'measure' and inst.name != 'barrier'):
            print(f"{i}th instruction '{inst.name}' not allowed")
    return cost


pm = PassManager()
coupling = [[0, 1], [0, 10], [1, 0], [1, 2], [2, 1], [2, 3], [3, 2], [3, 4], [4, 3], [4, 5], [4, 11], [5, 4], [5, 6],
            [6, 5], [6, 7], [7, 6], [7, 8], [8, 7], [8, 9], [8, 12], [9, 8], [10, 0], [10, 13], [11, 4], [11, 17],
            [12, 8], [12, 21], [13, 10], [13, 14], [14, 13], [14, 15], [15, 14], [15, 16], [15, 24], [16, 15], [16, 17],
            [17, 11], [17, 16], [17, 18], [18, 17], [18, 19], [19, 18], [19, 20], [19, 25], [20, 19], [20, 21],
            [21, 12], [21, 20], [21, 22], [22, 21], [22, 23], [23, 22], [23, 26], [24, 15], [24, 29], [25, 19],
            [25, 33], [26, 23], [26, 37], [27, 28], [27, 38], [28, 27], [28, 29], [29, 24], [29, 28], [29, 30],
            [30, 29], [30, 31], [31, 30], [31, 32], [31, 39], [32, 31], [32, 33], [33, 25], [33, 32], [33, 34],
            [34, 33], [34, 35], [35, 34], [35, 36], [35, 40], [36, 35], [36, 37], [37, 26], [37, 36], [38, 27],
            [38, 41], [39, 31], [39, 45], [40, 35], [40, 49], [41, 38], [41, 42], [42, 41], [42, 43], [43, 42],
            [43, 44], [43, 52], [44, 43], [44, 45], [45, 39], [45, 44], [45, 46], [46, 45], [46, 47], [47, 46],
            [47, 48], [47, 53], [48, 47], [48, 49], [49, 40], [49, 48], [49, 50], [50, 49], [50, 51], [51, 50],
            [51, 54], [52, 43], [52, 56], [53, 47], [53, 60], [54, 51], [54, 64], [55, 56], [56, 52], [56, 55],
            [56, 57], [57, 56], [57, 58], [58, 57], [58, 59], [59, 58], [59, 60], [60, 53], [60, 59], [60, 61],
            [61, 60], [61, 62], [62, 61], [62, 63], [63, 62], [63, 64], [64, 54], [64, 63]]

filename = "adder-3.qasm"
input_path = './original/' + filename

q = QuantumRegister(7, 'q')
meas = ClassicalRegister(7, 'meas')
in_circ = QuantumCircuit(q, meas)
in_circ.h(3)
in_circ.cx(0, 6)
in_circ.cx(6, 0)
in_circ.cx(0, 1)
in_circ.cx(3, 1)
in_circ.cx(3, 0)
in_circ.barrier(0, 1, 2, 3, 4, 5, 6)
in_circ.measure(0, 0)


""" own implementation """
output_path1 = './mapped/own/' + filename
coupling_map = CouplingMap(couplinglist=coupling)

# get quantum circuit from file
qc = QuantumCircuit.from_qasm_file(path=input_path)
mapper = Sabre(coupling_map, layout_strategy='sabre')
pm.append(mapper)
qc_transpiled = pm.run(in_circ)

print(qc_transpiled.draw(output='text'))

# add layout comment on top of output-.qasm
layout_comment = get_layout_description_comment(mapper.initial_layout, circuit_to_dag(qc_transpiled))
qasm = qc_transpiled.qasm()
qasm = qasm.replace('\n', '\n' + layout_comment + '\n', 1)
with open(output_path1, "w+") as file:
    file.write(qasm)
file.close()

print("Own cost : ", get_circuit_cost(qc_transpiled))

""" qiskit standard """
output_path2 = './mapped/benchmark/' + filename
qc = QuantumCircuit.from_qasm_file(path=input_path)
qc_transpiled = transpile(in_circ, backend=FakeBrooklyn())

# print(qc_transpiled.draw(output='text'))
qc_transpiled.qasm(filename=output_path2)
print("Standard cost: ", get_circuit_cost(qc_transpiled))
