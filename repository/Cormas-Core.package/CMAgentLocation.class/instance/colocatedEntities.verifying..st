+ environment - sensing - agents
colocatedEntities: locatedEntityName verifying: aBlock
	"Purpose: returns all entities of a given type located in the same location as the receiver and verifying a specified condition.
Arguments: 	locatedEntityName = <Symbol | Class>
			aBlock = <BlockClosure>
Return value: <Collection(AgentLocation | ObjectLocation)>
Example: self colocatedEntities: #Prey verifying: [:p | p isWeak]"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse:
			[(self colocatedEntities: locatedEntityName) select: [:a | aBlock value: a]]