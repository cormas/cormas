- testing
isDownstreamFrom: anotherNode
	"answers if anotherNode is a component of its network towards the down stream direction (taking into account the orientation of the network)"
	
	| orderedNodes |
	orderedNodes := self fullNetwork nodes.
	(orderedNodes includes: anotherNode) ifFalse: [^false].
	anotherNode downstreamWays do: [:w | (w includes: self) ifTrue: [^true]].
	^false