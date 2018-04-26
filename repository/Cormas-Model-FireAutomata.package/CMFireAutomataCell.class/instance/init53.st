init
init53
	Cormas random < 0.53
		ifTrue: [ self state: #tree ]
		ifFalse: [ self state: #empty ]