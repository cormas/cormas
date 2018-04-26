+ network
noneCyclicOutputs
	"Returns a collection of nodes that are none cyclic output nodes (ie. nodes that do not belongs to the cycles of the node receiver)"
	
	| allCyclicNodes noneCyclicOutputs cyclicWays |
	cyclicWays := self cyclicWays.
	cyclicWays isEmpty ifTrue: [^self outgoingNodes].
	noneCyclicOutputs := OrderedCollection new.
	allCyclicNodes := OrderedCollection new.
	cyclicWays do: [:cw | allCyclicNodes addAll: cw].
	allCyclicNodes
		do:
			[:node | 
			node outgoingNodes
				do:
					[:outNode | 
					(allCyclicNodes includes: outNode)
						ifFalse: [noneCyclicOutputs add: outNode]]].
	^noneCyclicOutputs