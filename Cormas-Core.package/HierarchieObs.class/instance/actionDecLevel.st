actions
actionDecLevel
	
	oneLevel value ifTrue: [^self].
	levelHolder value: levelHolder value - 1