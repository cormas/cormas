+ environment - picking - agents
colocatedEntity: locatedEntityName verifying: aCondition
	"Purpose: picks RANDOMLY one among the co-located entities of a given type verifying a specified condition. 
If none: returns nil; if more than one: random selection
Argument: aCondition = <BlockClosure>
Return value: <AgentLocation | ObjectLocation | nil>
Example: self colocatedEntity: #Prey verifying: [:a | a isWeak]"
	
	| candidates |
	candidates := self colocatedEntities: locatedEntityName verifying:
			aCondition.
	^(candidates isNil or: [candidates isEmpty])
		ifTrue: [nil]
		ifFalse: [Cormas selectRandomlyFrom: candidates]