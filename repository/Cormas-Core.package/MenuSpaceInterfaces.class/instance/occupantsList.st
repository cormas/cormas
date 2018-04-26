aspects
occupantsList
	
	^occupantsList isNil
		ifTrue: [occupantsList := SelectionInList new]
		ifFalse: [occupantsList]