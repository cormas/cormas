+ testing
isDownstreamFrom: anotherArc
	"answers if anotherArc is a component of its network towards the down stream direction (taking into account the orientation of the network)"
	
	| orderedArcs |
	orderedArcs := self fullNetwork arcs.
	(orderedArcs includes: anotherArc) ifFalse: [^false].
	anotherArc downstreamWays do: [:w | (w includes: self) ifTrue: [^true]].
	^false