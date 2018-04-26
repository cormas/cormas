access methods
canBeMovedFor: aClass
	
	(self canBeMoved keys includes: aClass)
		ifFalse:
			[self canBeMoved
				at: aClass
				put: aClass isSituatedClass].
	^self canBeMoved at: aClass