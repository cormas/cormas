star testing
hasNoneCyclicOutput
	"Answer if the node has none cyclic output nodes  (ie. nodes that do not belongs to the cycles of the node receiver)"
	"^self noneCyclicOutputs isEmpty not"
	| allCyclicNodes |
	allCyclicNodes := IndexedSet new.
	self cyclicWays do: [:cw | allCyclicNodes addAll: cw].
	allCyclicNodes isEmpty ifTrue:[^true].
	allCyclicNodes do:
			[:node | 
			node outgoingNodes
				do: [:outNode | (allCyclicNodes includes: outNode) ifFalse: [^true]]].
	^false