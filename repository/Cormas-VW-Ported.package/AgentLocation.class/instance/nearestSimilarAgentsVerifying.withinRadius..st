+ environment - sensing - agents
nearestSimilarAgentsVerifying: aBlock withinRadius: range
	"Purpose: returns the nearest receiver-like instances located withing a given radius of the receiver location and fulfilling a specified constraint
Arguments: aBlock = <BlockClosure>
			range = <Integer>
Return value: <Collection(AgentLocation)>
Example: self nearestSimilarAgentsVerifying: [:a | a sex ~= self sex] withinRadius: self pheromonePerceptionRange"
	
	^self
		nearestLocatedEntities: self class name
		verifying: aBlock
		withinRadius: range