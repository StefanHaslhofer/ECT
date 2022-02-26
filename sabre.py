from qiskit import QuantumCircuit
from qiskit.circuit.library import SwapGate
from qiskit.converters import circuit_to_dag
from qiskit.dagcircuit import DAGOpNode
from qiskit.transpiler import TransformationPass
from qiskit.transpiler import Layout


# algorithm was inspired by
# Gushu Li, Yufei Ding, Yuan Xie, “Tackling the Qubit Mapping Problem for NISQ-Era Quantum
# Devices,” https://pypi.org/project/quantum-qubit-mapping/, pp. 4–7, 2019
class Sabre(TransformationPass):

    def __init__(self, coupling_map):
        super().__init__()
        self.coupling_map = coupling_map

    def run(self, dag):
        # get the initial layout from the dag
        layout = Layout.generate_trivial_layout(dag.qregs["q"])
        front_layer = dag.front_layer()

        return self.sabre_swap(front_layer, layout, dag, self.coupling_map)

    # returns true if gate is a one-qubit-gate or its two qubits are connected
    def qubits_connected(self, gate, coupling_graph, layout):
        return len(gate.qargs) == 1 or coupling_graph.graph.has_edge(
            layout._v2p[gate.qargs[0]], layout._v2p[gate.qargs[1]]
        )

    # search for indizes of all possible swaps
    def optain_swaps(self, front_layer, layout, coupling_graph):
        swaps = []
        # iterate over all neighbours of gates referenced in the front-layer
        for gate in front_layer:
            for qubit in gate.qargs:
                # add all neighbors to possible swap list
                for n in coupling_graph.neighbors(layout[qubit]):
                    # swap possible if distance is 1
                    swaps.append({'q1': qubit, 'q2': layout[n], 'gate': gate})

        return swaps

    # calculate the cumulative distance between all elements of the front layer and their successors after a
    # potential swap
    def calc_swap_score(self, swap, layout, front_layer, coupling_graph):
        layout.swap(swap['q1'], swap['q2'])
        distance = 0
        # take all gates of the front layer into account
        for gate in front_layer:
            if gate == swap['gate']:
                distance += coupling_graph.distance_matrix[layout[gate.qargs[0]]][layout[gate.qargs[1]]]
            else:
                distance += coupling_graph.distance_matrix[layout[gate.qargs[0]]][layout[gate.qargs[1]]]
        return distance

    def sabre_swap(self, front_layer, layout, dag, coupling_graph):
        executed_gates = []
        # generate new DAG based on the present structure
        # we iterate through all gates and sequentially add them to the new dag but with swaps
        new_dag = dag._copy_circuit_metadata()

        # iterate until no gates are left to execute
        # gates in the front_layer do not have any dependencies on other previous gates
        while front_layer:
            execute_gate_list = []
            # mark all gates that can be executed (I.e. all gates that are in the front layer)
            for fg in front_layer:
                # execute gate if qubits are neighbours
                if self.qubits_connected(fg, coupling_graph, layout):
                    execute_gate_list.append(fg)

            if execute_gate_list:
                for gate in execute_gate_list:
                    # add gate to new dag
                    new_dag.apply_operation_back(gate.op, gate.qargs, gate.cargs)
                    # remove executed gates
                    front_layer.remove(gate)
                    executed_gates.append(gate)
                    # iterate over successors and check if dependencies are resolved
                    # if so add them to the front layer as they are ready for execution
                    # filter by name=cx: due to specification only care about cnot
                    for succ in list(filter(lambda s: s.name == 'cx', dag.successors(gate))):
                        preds = list(filter(lambda s: s.name == 'cx', dag.predecessors(succ)))
                        # only add the successor-element to the front-layer if all its predecessors were already executed
                        if set(preds).issubset(executed_gates):
                            front_layer.append(succ)
            # swap bits if nothing can be executed
            else:
                score = []

                # obtain all possible swaps and their score based on a heuristic
                for swap in self.optain_swaps(front_layer, layout, coupling_graph):
                    score.append(
                        {'op': swap, 'score': self.calc_swap_score(swap, layout.copy(), front_layer, coupling_graph)})

                # chose the swap action with the minimal distance (score) after the gates switched position
                min_swap = min(score, key=lambda s: s['score'])['op']
                # get physical bits by index of logical bit
                swap_node = DAGOpNode(op=SwapGate(), qargs=[layout._p2v[min_swap['q1'].index], layout._p2v[min_swap['q2'].index]])
                # add a swap to the new dag
                new_dag.apply_operation_back(swap_node.op, swap_node.qargs, swap_node.cargs)
                new_dag.draw(scale=0.7, filename=None, style='color')
                # swap logical bits
                layout.swap(min_swap['q1'], min_swap['q2'])

        # TODO measurements are missing
        return new_dag
