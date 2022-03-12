from qiskit import QuantumCircuit, QuantumRegister
from qiskit.circuit.library import SwapGate
from qiskit.dagcircuit import DAGOpNode
from qiskit.transpiler import TransformationPass
from qiskit.transpiler import Layout
from qiskit.converters import circuit_to_dag, dag_to_circuit


# algorithm was inspired by
# Gushu Li, Yufei Ding, Yuan Xie, “Tackling the Qubit Mapping Problem for NISQ-Era Quantum
# Devices,” https://pypi.org/project/quantum-qubit-mapping/, pp. 4–7, 2019
class Sabre(TransformationPass):

    def __init__(self, coupling_map, layout_strategy='trivial'):
        super().__init__()
        self.coupling_map = coupling_map
        self.initial_mapping: Layout
        self.layout_strategy = layout_strategy

    #TODO not necessary maybe further research
    def generate_heuristic_layout(self, dag ):
        layout: Layout

        return layout

    def circuit_interaction(self, q1, dag):
        return dag

    # return the layout of the sabre-swaps output and use it as input later
    # due to optimized swaps we can assume that the output-layout is better than the trivial approach
    def generate_sabre_layout(self, dag, front_layer, layout):
        return self.sabre_swap(front_layer, layout, dag, self.coupling_map)[1]

    def run(self, dag):
        # append overflow register
        self.fillup_qregs(dag)
        front_layer = dag.front_layer()

        layout: Layout

        # get the initial layout from the dag based on different strategies
        if(self.layout_strategy == 'trivial'):
            layout = Layout.generate_trivial_layout(*dag.qregs.values())
        elif(self.layout_strategy == 'sabre'):
            # we need a sabre-swap run with an initial trivial layout in order to use an optimized mapping
            layout = Layout.generate_trivial_layout(*dag.qregs.values())
            layout = self.generate_sabre_layout(dag, front_layer.copy(), layout)
        elif(self.layout_strategy == 'heuristic'):
            layout = self.generate_heuristic_layout(dag)

        self.initial_layout = layout.copy()

        return self.sabre_swap(front_layer, layout, dag, self.coupling_map)[0]

    # map unused qubits to an overflow register
    def fillup_qregs(self, dag):
        reg = QuantumRegister(len(self.coupling_map.physical_qubits) - len(dag.qubits), 'r')
        dag.add_qreg(reg)

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
                    # dag.qubits = physical qubits
                    # layout._v2p = virtual to physical mapping of current layout
                    # x = virtual qubit
                    new_dag.apply_operation_back(op=gate.op,
                                                 qargs=list(map(lambda x: dag.qubits[layout._v2p[x]], gate.qargs)),
                                                 cargs=gate.cargs)
                    # remove executed gates
                    front_layer.remove(gate)
                    executed_gates.append(gate)
                    # iterate over successors and check if dependencies are resolved
                    # if so add them to the front layer as they are ready for execution
                    # filter by instance of: ignore DAGInNodes and DAGOutNodes (they count as predecessors/successors)
                    for succ in list(filter(lambda s: isinstance(s, DAGOpNode), dag.successors(gate))):
                        preds = list(filter(lambda p: isinstance(p, DAGOpNode), dag.predecessors(succ)))

                        # only add the successor-element to the front-layer if all its predecessors were already executed
                        if set(preds).issubset(executed_gates):
                            front_layer.append(succ)

            # swap bits if nothing can be executed
            else:
                score = []

                # obtain all possible swaps and their score based on a heuristic
                for swap in self.optain_swaps(front_layer, layout, coupling_graph):
                    score.append(
                        {'op': swap,
                         'distance': self.calc_swap_score(swap, layout.copy(), front_layer, coupling_graph)})

                # chose the swap action with the minimal distance (score) after the gates switched position
                min_swap = min(score, key=lambda s: s['distance'])['op']
                # get physical bits by index of logical bit
                swap_node = DAGOpNode(op=SwapGate(), qargs=[
                    dag.qubits[layout._v2p[min_swap['q1']]],
                    dag.qubits[layout._v2p[min_swap['q2']]]
                ])
                # add a swap to the new dag
                new_dag.apply_operation_back(swap_node.op, swap_node.qargs, swap_node.cargs)
                # swap logical bits
                layout.swap(min_swap['q1'], min_swap['q2'])

        return new_dag, layout
