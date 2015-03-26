init
initTen
	" 10 % to be dead"
	
	CormasOld random < 0.1
		ifTrue: [self state: #dead]
		ifFalse: [self state: #alive]