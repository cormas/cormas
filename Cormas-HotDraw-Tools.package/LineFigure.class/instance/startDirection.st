accessing
startDirection
	
	| direction |
	direction := points first - (points at: 2).
	^direction = (0 @ 0)
		ifTrue: [1 @ 0]
		ifFalse: [direction unitVector]