+ environment - picking - agents
colocatedEntity: locatedEntityName
	"Purpose: picks RANDOMLY one among the co-located entities of a given type. 
If none: returns nil; if more than one: random selection
Argument: aCondition = <BlockClosure>
Return value: <AgentLocation | ObjectLocation | nil>
Example: self colocatedEntity: #Prey"
	
	| candidates |
	candidates := self colocatedEntities: locatedEntityName.
	^(candidates isNil or: [candidates isEmpty])
		ifTrue: [nil]
		ifFalse: [Cormas selectRandomlyFrom: candidates]