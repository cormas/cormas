+ accessing
latestMessage
	"Purpose: picks the latest message received in the mailbox, removes it from the mailbox and returns it
Return value: <Msg>"
	
	| aMsg |
	self mailBox isEmpty ifTrue: [^nil].
	aMsg := mailBox last.
	mailBox removeLast.
	^aMsg