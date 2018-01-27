+ environment - sensing - agents
similarAgentsWithinRadius: range
	"Purpose: returns the receiver-like instances located withing a given radius of the receiver location
Argument: range = <Integer>
Return value: <Collection(AgentLocation)>
Example: self similarAgentsWithinRadius: 3"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse:
			[self
				locatedEntities: self class name
				withinRadius: range]