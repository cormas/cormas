+ environment - sensing - agents
neighbouringLocatedEntities: locatedEntityName
	"Purpose: returns all entities of a given type located in the direct neighbourhood of the receiver current location.
The co-located entities are not considered here (for that, use locatedEntities: locatedEntityName withinRadius: 1)
Arguments: 	locatedEntityName = <Symbol | Class>
Return value: <Collection(AgentLocation | ObjectLocation)>
Example: self neighbouringLocatedEntities: #Predator"
	
	| collec |
	self patch ifNil: [^nil].
	collec := OrderedCollection new.
	self patch neighbourhood
		do: [:c | collec addAll: (c occupantsAt: locatedEntityName)].
	^collec