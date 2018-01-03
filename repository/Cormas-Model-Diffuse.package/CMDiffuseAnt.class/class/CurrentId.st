id
CurrentId
	^ CurrentId isNil
		ifTrue: [ 0 ]
		ifFalse: [ CurrentId ]