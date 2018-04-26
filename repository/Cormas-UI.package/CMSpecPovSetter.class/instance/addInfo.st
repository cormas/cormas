action
addInfo
	"adding a new POV method"
	
	| aName |
	(aName := self
		requestText: self infoName
		initialAnswer: 'info_'
		title: 'CORMAS') 
			ifNil: [ ^ self ]
			ifNotNil: [ self modifyInfo: aName asSymbol ].
	self listInfo list
		addFirst: aName asString , ' (' , selectedClass name asString , ')'.
	self listInfo selectionIndex: 1