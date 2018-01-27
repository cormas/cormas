+ environment - sensing - agents
neighbouringLocatedEntities: locatedEntityName verifying: aCondition
	"Purpose: returns all entities of a given type located in the direct neighbourhood of the receiver current location and verifying a specified condition.
The co-located entities are not considered here (for that, use locatedEntities: locatedEntityName verifying: aCondition withinRadius: 1)
Arguments: 	locatedEntityName = <Symbol | Class>
			aCondition = <BlockClosure>
Return value: <Collection(AgentLocation | ObjectLocation)>
Example: self neighbouringLocatedEntities: #Prey verifying: [:p | p isWeak]"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse:
			[(self neighbouringLocatedEntities: locatedEntityName)
				select: [:e | aCondition value: e]]