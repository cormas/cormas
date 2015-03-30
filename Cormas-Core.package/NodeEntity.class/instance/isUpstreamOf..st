- testing
isUpstreamOf: anotherNode
	"answers if anotherNode is a component of its network towards the down stream direction (taking into account the orientation of the network)"
	
	| orderedNodes |
	orderedNodes := self fullNetwork nodes.
	(orderedNodes includes: anotherNode) ifFalse: [^false].
	self downstreamWays do: [:w | (w includes: anotherNode) ifTrue: [^true]].
	^false