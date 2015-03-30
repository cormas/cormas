+ communication
to: anotherOne topic: aSymbol
	"Purpose: Creates a message with a receiver and a topic. The message can be sent by a communicant agent using the method sendMessageSynchronously:  or sendMessageAsynchronously:
Argument: anAgent = <AgentComm or AgentCommLocation
			aSymbol = <anObject>
Example: Msg to: anAgent topic: #hello)"
	
	^super new to: anotherOne topic: aSymbol