+ control - communication
sendSynchronouslyMsgTo: anAgent topic: aSymbol content: anObject
	"Purpose: sends and delivers  a message (with a topic and a content) at the end of the simulation timestep 
Arguments: anAgent = <AgentComm or AgentCommLocation
			aSymbol = <anObject>
			anObject = <anObject>
Example: self sendSynchronouslyMsgTo: self myFriend topic  #wantToBuy content: aLand )"
	
	| aMsg |
	aMsg := Msg from: self to: anAgent topic: aSymbol.
	self channel stock: aMsg