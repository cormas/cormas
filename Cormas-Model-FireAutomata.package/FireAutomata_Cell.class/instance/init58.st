init
init58
	CormasOld random < 0.58
		ifTrue: [ self state: #tree ]
		ifFalse: [ self state: #empty ]