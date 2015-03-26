+ environment - sensing - agents
nearestLocatedEntities: locatedEntityName withinRadius: range
	"Purpose: returns the nearest located entities of a given type withing a given radius of the current location.
Arguments: 	locatedEntityName = <Symbol | Class>
			range = <Integer>
Return value: <Collection(AgentLocation | ObjectLocation) | nil>
Example: self nearestLocatedEntities: #Predator withinRadius: self perceptionRangePredators"
	
	| entities n |
	self patch ifNil: [^nil].
	entities := OrderedCollection new.
	n := 0.
	[entities isEmpty and: [n <= range]]
		whileTrue:
			[entities := self locatedEntities: locatedEntityName withinRadius: n.
			n := n + 1].
	^entities