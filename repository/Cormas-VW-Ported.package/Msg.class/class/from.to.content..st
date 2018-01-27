deprecated
from: anAgent to: anotherOne content: anObject
	"Purpose: Creates a message with a sender, a receiver and a content. The message can be sent by a communicant agent using the method sendMessageSynchronously:  or sendMessageAsynchronously:
Argument: anAgent = <AgentComm or AgentCommLocation
			anotherOne = <AgentComm or AgentCommLocation	
			anObject = <anObject>
Example: Msg from: anAgent1 to: anAgent2 content: aGift)"
	
	self deprecated: 'Deprecated during Pharo 4.0 migration'.
	^super new from: anAgent to: anotherOne content: anObject