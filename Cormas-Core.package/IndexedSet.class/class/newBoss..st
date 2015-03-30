- utilities - binary storage
newBoss: listElements
	"Method only used for BOSS.
	Create a new instance of IndexedSet withour verifying if each element is already includes."
	
	| ag |
	ag := listElements isEmpty
		ifTrue: [self new]
		ifFalse: [self new: listElements size].
	listElements do: [:e | ag addLastNoCheck: e].
	^ag