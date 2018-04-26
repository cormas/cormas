+ communication
from: anAgent to: anotherOne topic: aSymbol content: anObject
	"Purpose: Creates a message with a sender, a receiver, a topic and a content. The message can be sent by a communicant agent using the method sendMessageSynchronously:  or sendMessageAsynchronously:
Argument: anAgent = <AgentComm or AgentCommLocation
			anotherOne = <AgentComm or AgentCommLocation	
			aSymbol = <anObject>
			anObject = <anObject>
Example: Msg from: anAgent1 to: anAgent2 topic: #comeHere content: aSpatialEntity)"
	
	^super new from: anAgent to: anotherOne topic: aSymbol content: anObject