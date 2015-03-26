+ control - communication
sendSynchronouslyMsgToAll: aCollection topic: aSymbol
	"Purpose: sends and delivers to many agents a same message (with a topic) at the end of the simulation timestep 
Arguments: aCollection =  <a collection of AgentCommLocation or AgentCommLocationLocation>
			aSymbol = <anObject>
Example: self sendSynchronouslyMsgToAll: self acquaintances  topic  #hello)"
	
	| aMsg |
	aCollection
		do:
			[:anAgent | 
			aMsg := Msg from: self to: anAgent topic: aSymbol.
			self channel stock: aMsg]