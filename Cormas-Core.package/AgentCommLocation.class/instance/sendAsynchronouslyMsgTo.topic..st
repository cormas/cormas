+ control - communication
sendAsynchronouslyMsgTo: anAgent topic: aSymbol
	"Purpose: sends and delivers IMMEDIATELY a message (with a topic) 
Arguments: anAgent = <AgentCommLocation or AgentCommLocationLocation
			aSymbol = <anObject>
Example: self sendAsynchronouslyMsgTo: self myFriend topic  #hello)"
	
	| aMsg |
	aMsg := Msg from: self to: anAgent topic: aSymbol.
	self channel transmit: aMsg