aspects
histoList
	
	^histoList isNil
		ifTrue: [histoList := SelectionInList new]
		ifFalse: [histoList]