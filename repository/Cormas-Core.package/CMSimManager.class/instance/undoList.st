accessing
undoList
	
	^undoList ifNil: [undoList := OrderedCollection new]