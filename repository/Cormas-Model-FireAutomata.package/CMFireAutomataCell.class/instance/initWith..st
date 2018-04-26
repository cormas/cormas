init
initWith: aNumber

	Cormas random < aNumber
		ifTrue: [ self state: #tree ]
		ifFalse: [ self state: #empty ]