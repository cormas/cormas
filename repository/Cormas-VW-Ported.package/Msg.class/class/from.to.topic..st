+ communication
from: anAgent to: anotherOne topic: anObject
	"Purpose: Creates a message with a sender, a receiver and a topic. The message can be sent by a communicant agent using the method sendMessageSynchronously:  or sendMessageAsynchronously:
Argument: anAgent = <AgentComm or AgentCommLocation
			anotherOne = <AgentComm or AgentCommLocation	
			anObject = <anObject>
Example: Msg from: anAgent1 to: anAgent2 topic: #hello)"
	
	^super new from: anAgent to: anotherOne topic: anObject