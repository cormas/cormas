+ control - communication
sendAsynchronouslyMsgToAll: aCollection topic: aSymbol content: anObject
	"Purpose: sends and delivers IMMEDIATLY to many agents a same message (with a topic and a content)
Arguments: anAgent = aCollection =  <a collection of AgentComm or AgentCommLocation>
			aSymbol = <anObject>
			anObject = <anObject>
Example: self sendAsynchronouslyMsgToAll: self acquaintances topic  #fireHere content: aCell )"
	
	| aMsg |
	aCollection
		do:
			[:anAgent | 
			aMsg := Msg from: self to: anAgent topic: aSymbol content: anObject.
			self channel transmit: aMsg]