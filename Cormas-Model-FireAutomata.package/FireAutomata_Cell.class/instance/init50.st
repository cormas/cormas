init
init50
	Cormas random < 0.5
		ifTrue: [ self state: #tree ]
		ifFalse: [ self state: #empty ]