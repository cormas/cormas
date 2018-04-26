+ environment - sensing - agents
colocatedSimilarAgentsVerifying: aBlock
	"Purpose: returns all receiver-like entities located in the same location as the receiver and verifying a specified condition.
Argument: aBlock = <BlockClosure>
Return value: <Collection(AgentLocation)>
Example: self colocatedSimilarAgentsVerifying: [:a | a sex ~= self sex] "
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse: [self colocatedSimilarAgents select: [:a | aBlock value: a]]