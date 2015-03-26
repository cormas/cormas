+ control - communication
sendAsynchronouslyMsgTo: anAgent topic: aSymbol content: anObject
	"Purpose: sends and delivers IMMEDIATELY a message (with a topic and a content)
Arguments: anAgent = <AgentCommLocation or AgentCommLocationLocation
			aSymbol = <anObject>
			anObject = <anObject>
Example: self sendAsynchronouslyMsgTo: self myFriend topic  #wantToBuy content: aLand )"
	
	| aMsg |
	aMsg := Msg from: self to: anAgent topic: aSymbol.
	self channel transmit: aMsg