accessing
redoList
	
	^redoList ifNil: [redoList := OrderedCollection new]