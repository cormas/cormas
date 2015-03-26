init
init53
	CormasOld random < 0.53
		ifTrue: [ self state: #tree ]
		ifFalse: [ self state: #empty ]