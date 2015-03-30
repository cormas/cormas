adding
addFirst: newObject
	"Add newObject to the beginning of the receiver.  Answer newObject."
	
	(self includes: newObject) ifFalse: [^super addFirst: newObject].
	^newObject