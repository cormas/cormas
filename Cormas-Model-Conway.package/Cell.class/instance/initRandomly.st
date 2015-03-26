init
initRandomly
	
	CormasOld random < 0.5
		ifTrue: [self state: #dead]
		ifFalse: [self state: #alive]