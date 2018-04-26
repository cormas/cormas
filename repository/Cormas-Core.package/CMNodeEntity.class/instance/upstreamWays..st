- way
upstreamWays: previousWays
	"returns a collection of ways towards the up stream direction (taking into account the orientation of the network) .
	Recursivity ! "
	
	| fullWays upArcs waysToMe newWay cyclicWays noneCyclicNodes bifurcationNodes waysToNextBifurcation |
	waysToMe := OrderedCollection new.
	previousWays
		do:
			[:w | 
			newWay := w copy.
			newWay add: self.
			waysToMe add: newWay].
	upArcs := self incomingArcs.
	upArcs isEmpty ifTrue: [^waysToMe].
	fullWays := OrderedCollection new.	"if is cylic, so do not use this way"
	cyclicWays := previousWays select: [:w | w includes: self].
	upArcs
		do:
			[:arc | 
			cyclicWays isEmpty
				ifTrue: [fullWays addAll: (arc startNode upstreamWays: waysToMe)]
				ifFalse:
					[cyclicWays
						do:
							[:cw | 
							arc startNode = (cw at: (cw indexOf: self) + 1)
								ifTrue:
									[bifurcationNodes := cw select: [:bifNode | bifNode incomingArcs size > 1].
									bifurcationNodes
										do:
											[:bifNode | 
											waysToNextBifurcation := OrderedCollection new.
											waysToMe do: [:wtm | waysToNextBifurcation add: wtm copy].
											waysToNextBifurcation
												do:
													[:wti | 
													| partOfCycle start end |
													start := 1 + (cw indexOf: self).
													end := cw indexOf: bifNode.
													start > end ifTrue: [end := cw lastIndexOf: bifNode].
													start > end
														ifTrue: [partOfCycle := #()]
														ifFalse: [partOfCycle := cw copyFrom: start to: end].
													wti addAll: partOfCycle].
											noneCyclicNodes := bifNode incomingNodes
												select: [:outNode | (cw includes: outNode) not].
											noneCyclicNodes
												do:
													[:ncn | fullWays addAll: (ncn upstreamWays: waysToNextBifurcation)]]]
								ifFalse: [fullWays addAll: (arc startNode upstreamWays: waysToMe)]]]].
	^fullWays