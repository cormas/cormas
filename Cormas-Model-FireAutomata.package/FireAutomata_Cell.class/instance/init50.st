init
init50
	CormasOld random < 0.5
		ifTrue: [ self state: #tree ]
		ifFalse: [ self state: #empty ]