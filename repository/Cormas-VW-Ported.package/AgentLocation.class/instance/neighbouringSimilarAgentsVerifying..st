+ environment - sensing - agents
neighbouringSimilarAgentsVerifying: aCondition
	"Purpose: returns all receiver-like entities located in the direct neighbourhood of the receiver current location and verifying a specified condition.
The co-located entities are not considered here (#neighbouringSimilarAgentsVerifying: aCondition is equivalent to #similarAgentsVerifying: aCondition withinRadius: 1)
Argument: aCondition = <BlockClosure>
Return value: <Collection(AgentLocation)>
Example: self neighbouringSimilarAgentsVerifying: [:a | a sex ~= self sex]"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse:
			[self neighbouringSimilarAgents select: [:e | aCondition value: e]]