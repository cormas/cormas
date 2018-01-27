+ environment - sensing - agents
nearestLocatedEntities: locatedEntityName verifying: aBlock withinRadius: range
	"Purpose: returns the nearest located entities of a given type withing a given radius of the current location and fulfilling a specified contraint.
Arguments: 	locatedEntityName = <Symbol | Class>
			aBlock = <BlockClosure>
			range = <Integer>
Return value: <Collection(AgentLocation | ObjectLocation) | nil>
Example: self nearestLocatedEntities: #Predator verifying: [:a | a isHungry] withinRadius: self perceptionRangePredators"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse:
			[(self nearestLocatedEntities: locatedEntityName withinRadius: range)
				select: [:e | aBlock value: e]]