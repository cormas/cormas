accessing
blocks
	
	^blocks isNil
		ifTrue: [Dictionary new]
		ifFalse: [blocks]