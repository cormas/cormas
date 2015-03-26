+ control - communication
sendAsynchronouslyMsgToAll: aCollection topic: aSymbol
	"Purpose: sends and delivers IMMEDIATLY to many agents a same message (with a topic)
Arguments: aCollection =  <a collection of AgentComm or AgentCommLocation>
			aSymbol = <anObject>
Example: self sendAsynchronouslyMsgToAll: self acquaintances  topic  #hello)"
	
	| aMsg |
	aCollection
		do:
			[:anAgent | 
			aMsg := Msg from: self to: anAgent topic: aSymbol.
			self channel transmit: aMsg]