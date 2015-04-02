+ environment - picking - agents
nearestSimilarAgentWithingRadius: range
	"Purpose: picks RANDOMLY one among the nearest receiver-like entities located withing a given radius of the receiver current location.
If none: returns nil; if more than one: random selection
Argument: 	range = <Integer>
Return value: <AgentLocation | nil>
Example: self nearestSimilarAgentWithinRadius: 2"
	
	| candidates |
	candidates := self nearestSimilarAgentsWithinRadius: range.
	^(candidates isNil or: [candidates isEmpty])
		ifTrue: [nil]
		ifFalse: [Cormas selectRandomlyFrom: candidates]