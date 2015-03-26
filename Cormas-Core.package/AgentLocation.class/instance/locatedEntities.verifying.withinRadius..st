+ environment - sensing - agents
locatedEntities: locatedEntityName verifying: aBlock withinRadius: range
	"Purpose: returns all located entities of a given type withing a given radius of the current location and fulfilling a specified contraint.
Arguments: 	locatedEntityName = <Symbol | Class>
			aBlock = <BlockClosure>
			range = <Integer>
Return value: <Collection(AgentLocation | ObjectLocation)>
Example: self locatedEntities: #Predator verifying: [:a | a isHungry] withinRadius: self perceptionRangePredators"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse:
			[(self locatedEntities: locatedEntityName withinRadius: range)
				select: [:a | aBlock value: a]]