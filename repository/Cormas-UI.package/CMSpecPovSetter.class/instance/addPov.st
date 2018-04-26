action
addPov
	"adding a new POV method"
	
	| aName |
	
	(aName := self
		requestText: self povName
		title: 'CORMAS') 
			ifNil: [ ^ self ]
			ifNotNil: [ self modifyPov: aName asSymbol ].	
		self listMethods list
		addFirst: aName asString , ' (' , selectedClass name asString , ')'.
	self listMethods selectionIndex: 1