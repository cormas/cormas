action
addInfo
	"adding a new POV method"
	
	| aName |
	aName := (Dialog
		request: self infoName
		initialAnswer: 'info_'
		onCancel: [^self]) asSymbol.
	self modifyInfo: aName.
	self listInfo list
		addFirst: aName asString , ' (' , selectedClass name asString , ')'.
	self listInfo selectionIndex: 1