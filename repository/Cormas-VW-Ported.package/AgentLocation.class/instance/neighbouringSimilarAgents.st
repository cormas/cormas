+ environment - sensing - agents
neighbouringSimilarAgents
	"Purpose: returns all receiver-like entities located in the direct neighbourhood of the receiver current location.
The co-located entities are not considered here (#neighbouringSimilarAgents is equivalent to #similarAgentsWithinRadius: 1)
Return value: <Collection(AgentLocation)>"
	
	^self neighbouringLocatedEntities: self class name