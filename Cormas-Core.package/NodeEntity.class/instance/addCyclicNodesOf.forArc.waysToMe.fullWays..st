- way
addCyclicNodesOf: cw forArc: arc waysToMe: waysToMe fullWays: fullWays
	
	| bifurcationNodes waysToNextBifurcation noneCyclicNodes |
	arc stopNode = (cw at: (cw indexOf: self) + 1)
		ifTrue:
			[bifurcationNodes := cw select: [:bifNode | bifNode outgoingArcs size > 1].
			bifurcationNodes
				do:
					[:bifNode | 
					waysToNextBifurcation := OrderedCollection new.
					waysToMe do: [:wtm | waysToNextBifurcation add: wtm copy].
					waysToNextBifurcation
						do:
							[:wtnb | 
							| partOfCycle start end |
							start := 1 + (cw indexOf: self).
							end := cw indexOf: bifNode.
							start > end ifTrue: [end := cw lastIndexOf: bifNode].
							start > end
								ifTrue: [partOfCycle := #()]
								ifFalse: [partOfCycle := cw copyFrom: start to: end].
							wtnb addAll: partOfCycle.
							noneCyclicNodes := bifNode outgoingNodes
								select: [:outNode | (cw includes: outNode) not].
							noneCyclicNodes isEmpty
								ifTrue:
									[fullWays addAll: waysToNextBifurcation.
									^fullWays].	"this node have no noneCyclic output arc"
							noneCyclicNodes
								do:
									[:ncn | fullWays addAll: (ncn downstreamWays: waysToNextBifurcation)]]]]
		ifFalse: [fullWays addAll: (arc stopNode downstreamWays: waysToMe)]