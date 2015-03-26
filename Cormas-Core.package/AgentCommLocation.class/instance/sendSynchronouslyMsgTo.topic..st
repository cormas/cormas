+ control - communication
sendSynchronouslyMsgTo: anAgent topic: aSymbol
	"Purpose: sends and delivers a message (with a topic) at the end of the simulation timestep 
Arguments: anAgent = <AgentCommLocation or AgentCommLocationLocation
			aSymbol = <anObject>
Example: self sendSynchronouslyMsgTo: self myFriend topic  #hello)"
	
	| aMsg |
	aMsg := Msg from: self to: anAgent topic: aSymbol.
	self channel stock: aMsg