+ control
sendMessageSynchronously: aMsg
	"Purpose: sends and delivers a given message at the end of the simulation timestep 
Argument: aMsg = <Msg>
Example: self sendMessageSynchronously: (Msg to: self myFriend topic  #hello)"
	
	aMsg sender: self.
	self channel stock: aMsg