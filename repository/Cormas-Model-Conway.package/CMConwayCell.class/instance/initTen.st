init
initTen
	" 10 % to be dead"

	Cormas random < 0.1
		ifTrue: [ self state: #dead ]
		ifFalse: [ self state: #alive ]