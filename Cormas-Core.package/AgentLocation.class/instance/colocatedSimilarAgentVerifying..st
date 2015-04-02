+ environment - picking - agents
colocatedSimilarAgentVerifying: aCondition
	"Purpose: picks RANDOMLY one among the co-located receiver-like entities verifying a specified condition. 
If none: returns nil; if more than one: random selection
Argument: aCondition = <BlockClosure>
Return value: <AgentLocation | nil>
Example: self colocatedSimilarAgentVerifying: [:a | a sex ~= self sex]"
	
	| candidates |
	candidates := self colocatedSimilarAgentsVerifying: aCondition.
	^(candidates isNil or: [candidates isEmpty])
		ifTrue: [nil]
		ifFalse: [Cormas selectRandomlyFrom: candidates]