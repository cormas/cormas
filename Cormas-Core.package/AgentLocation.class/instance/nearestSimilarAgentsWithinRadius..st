+ environment - sensing - agents
nearestSimilarAgentsWithinRadius: range
	"Purpose: returns the nearest receiver-like entities located withing a given radius of the receiver current location.
Argument: 	lrange = <Integer>
Return value: <Collection(AgentLocation) | nil>
Example: self nearestSimilarAgentsWithinRadius: 2"
	
	^self
		nearestLocatedEntities: self class name
		withinRadius: range