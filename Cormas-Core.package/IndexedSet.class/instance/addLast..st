adding
addLast: newObject
	"Add newObject to the end of the receiver.  Answer newObject."
	
	(self includes: newObject) ifFalse: [^super addLast: newObject].
	^newObject