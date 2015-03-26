+ environment - picking - agents
colocatedSimilarAgent
	"Purpose: picks RANDOMLY one among the co-located receiver-like entities. 
If none: returns nil; if more than one: random selection
Return value: <AgentLocation | nil>"
	
	| candidates |
	candidates := self colocatedSimilarAgents.
	^(candidates isNil or: [candidates isEmpty])
		ifTrue: [nil]
		ifFalse: [Cormas selectRandomlyFrom: candidates]