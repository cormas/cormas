accessing
stopDirection
	
	| direction |
	direction := points last - (points at: points size - 1).
	^direction = (0 @ 0)
		ifTrue: [1 @ 0]
		ifFalse: [direction unitVector]