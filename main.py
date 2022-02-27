from qiskit import QuantumCircuit, QuantumRegister, transpile
from qiskit.converters import circuit_to_dag
from qiskit.transpiler import PassManager, CouplingMap
from sabre import Sabre
from qiskit.test.mock.backends import FakeBrooklyn

# coupling of a brooklyn device as a list representation
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

#####path = './original/ghz_state-5.qasm'
#####qc = QuantumCircuit.from_qasm_file(path=path)

pm = PassManager()

q = QuantumRegister(65, 'q')
in_circ = QuantumCircuit(q)
in_circ.h(3)
in_circ.cx(0, 6)
in_circ.cx(6, 0)
in_circ.cx(0, 1)
in_circ.cx(3, 1)
in_circ.cx(3, 0)
print(in_circ.draw(output='text'))

coupling_map = CouplingMap(couplinglist=coupling)
pm.append([Sabre(coupling_map)])

qc_transpiled = pm.run(in_circ)
print(qc_transpiled.draw(output='text'))

qc_transpiled2 = transpile(in_circ, backend=FakeBrooklyn(), routing_method='sabre')
print(qc_transpiled2.draw(output='text'))

filename = './mapped/circuit.qasm'
qc_transpiled.qasm(filename=filename)

filename2 = './mapped/circuit2.qasm'
qc_transpiled2.qasm(filename=filename2)