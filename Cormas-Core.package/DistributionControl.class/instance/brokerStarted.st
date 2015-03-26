actions
brokerStarted
	"true if the broker is actually started"
	
	^broker notNil and: [broker isRunning]