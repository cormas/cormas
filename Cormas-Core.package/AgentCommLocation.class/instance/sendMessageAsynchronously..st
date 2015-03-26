+ control
sendMessageAsynchronously: aMsg
	"Purpose: sends and delivers IMMEDIATELY a given message
Argument: aMsg = <Msg>
Example: self sendMessageAsynchronously: (Msg to: self myFriend topic: #hello)"
	
	aMsg sender: self.
	self channel transmit: aMsg