+ communication
to: anotherOne topic: aSymbol content: anObject
	"Purpose: Creates a message with a receiver, a topic and a content. The message can be sent by a communicant agent using the method sendMessageSynchronously:  or sendMessageAsynchronously:
Argument: anAgent = <AgentComm or AgentCommLocation
			aSymbol = <anObject>
			anObject = <anObject>
Example: Msg to: anAgent topic: #comeHere content: aSpatialEntity)"
	
	^super new to: anotherOne topic: aSymbol content: anObject