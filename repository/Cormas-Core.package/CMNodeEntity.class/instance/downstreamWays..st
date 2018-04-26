- way
downstreamWays: previousWays
	"returns a collection of ways towards the down stream direction (taking into account the orientation of the network) .
	Recursivity ! "
	
	| fullWays downArcs waysToMe newWay cyclicWays |
	waysToMe := OrderedCollection new.
	previousWays
		do:
			[:w | 
			newWay := w copy.
			newWay add: self.
			waysToMe add: newWay].
	downArcs := self outgoingArcs.
	downArcs isEmpty ifTrue: [^waysToMe].
	fullWays := OrderedCollection new.	"if is cylic, so do not use this way"
	cyclicWays := previousWays select: [:w | w includes: self].
	downArcs
		do:
			[:arc | 
			cyclicWays isEmpty
				ifTrue: [fullWays addAll: (arc stopNode downstreamWays: waysToMe)]
				ifFalse:
					[cyclicWays
						do:
							[:cw | 
							"|nbOcc| nbOcc := (cw occurrencesOf: self). nbOcc > 1 ifTrue:[nbOcc halt]. "
							"(self checkOrientedWay: cw) ifFalse:[self halt]."
							self addCyclicNodesOf: cw forArc: arc waysToMe: waysToMe fullWays:
									fullWays]]].
	^fullWays