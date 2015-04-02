init
init58
	Cormas random < 0.58
		ifTrue: [ self state: #tree ]
		ifFalse: [ self state: #empty ]