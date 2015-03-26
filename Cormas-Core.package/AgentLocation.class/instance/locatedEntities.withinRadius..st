+ environment - sensing - agents
locatedEntities: locatedEntityName withinRadius: range
	"Purpose: returns all located entities of a given type withing a given radius of the current location (all locatedEntityName subclasses are considered).
Arguments: 	locatedEntityName = <Symbol | Class>
			range = <Integer>
Return value: <Collection(AgentLocation | ObjectLocation)>
Example: self locatedEntities: #Predator withinRadius: self perceptionRangePredators"
	
	| collec |
	self patch ifNil: [^nil].
	collec := OrderedCollection new.
	(self locationsWithinRadius: range)
		do: [:c | collec addAll: (c occupantsAt: locatedEntityName)].
	(collec includes: self) ifTrue: [collec remove: self].
	^collec