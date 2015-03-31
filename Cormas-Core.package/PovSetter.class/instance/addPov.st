action
addPov
	"adding a new POV method"
	
	| aName |
	aName := (Dialog
		request: self povName
		initialAnswer: ''
		onCancel: [^self]) asSymbol.
	self modifyPov: aName.
	self listMethods list
		addFirst: aName asString , ' (' , selectedClass name asString , ')'.
	self listMethods selectionIndex: 1