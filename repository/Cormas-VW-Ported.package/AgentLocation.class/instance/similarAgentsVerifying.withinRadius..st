+ environment - sensing - agents
similarAgentsVerifying: aBlock withinRadius: range
	"Purpose: returns the receiver-like instances located withing a given radius of the receiver location and fulfilling a specified constraint
Arguments: aBlock = <BlockClosure>
			range = <Integer>
Return value: <Collection(AgentLocation)>
Example: self similarAgentsVerifying: [:a | a sex ~= self sex] withinRadius: self pheromonePerceptionRange"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse:
			[self
				locatedEntities: self class name
				verifying: aBlock
				withinRadius: range]