+ accessing
oldestMessage
	"Purpose: picks the oldest message still stored in the mailbox, removes it from the mailbox and returns it
Return value: <Msg>"
	
	| aMsg |
	mailBox isEmpty ifTrue: [^nil].
	aMsg := mailBox first.
	mailBox removeFirst.
	^aMsg