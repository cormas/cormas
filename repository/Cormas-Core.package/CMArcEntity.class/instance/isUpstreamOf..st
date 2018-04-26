+ testing
isUpstreamOf: anotherArc
	"answers if anotherArc is a component of its network towards the up stream direction (taking into account the orientation of the network)"
	
	| orderedArcs |
	orderedArcs := self fullNetwork nodes.
	(orderedArcs includes: anotherArc) ifFalse: [^false].
	self downstreamWays do: [:w | (w includes: anotherArc) ifTrue: [^true]].
	^false