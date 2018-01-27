deprecated
to: anAgent content: anObject
	"Purpose: Creates a message with a receiver and a content. The message can be sent by a communicant agent using the method sendMessageSynchronously:  or sendMessageAsynchronously:
Argument: anAgent = <AgentComm or AgentCommLocation
			aContent = <anObject>
Example: Msg to: anAgent content: aGift)"
	
	self deprecated: 'Deprecated during Pharo 4.0 migration'.
	^super new to: anAgent content: anObject