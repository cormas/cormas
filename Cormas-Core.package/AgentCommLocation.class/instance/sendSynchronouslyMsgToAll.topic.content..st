+ control - communication
sendSynchronouslyMsgToAll: aCollection topic: aSymbol content: anObject
	"Purpose: sends and delivers to many agents a same message (with a topic and a content) at the end of the simulation timestep 
Arguments: anAgent = aCollection =  <a collection of AgentCommLocation or AgentCommLocationLocation>
			aSymbol = <anObject>
			anObject = <anObject>
Example: self sendSynchronouslyMsgToAll: self acquaintances topic  #fireHere content: aCell )"
	
	| aMsg |
	aCollection
		do:
			[:anAgent | 
			aMsg := Msg from: self to: anAgent topic: aSymbol content: anObject.
			self channel stock: aMsg]