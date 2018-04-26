actions while painting
changeAttributeByPainting
	"change the attributeToChange value with valueForAttribute by the cells clicked by the user.
	The activateToolNamed is set to 'ChangeAttribute Tool' "
	
	self initializeByPainting ifNil: [^nil].
	self linkedSpaceInterface view
		manipulatedEntity:
			self entity value asSymbol class.
	self linkedSpaceInterface view manipulationAction: #setValue.
	self linkedSpaceInterface view
		clicToChangeAttribute: self attributeToChange value
		withValue: self valueForAttribute value	"en fait, on pourrait aussi passer par l'appel directement √† l accesseur en √©criture "	"	self attributeToChange value isNil
		ifTrue: [^Dialog warn: 'Please select an attribute'].
	self valueForAttribute value isNil
		ifTrue: [^Dialog warn: 'Please select a value'].
	self initializeByPainting.
	self linkedSpaceInterface view
		manipulationAction: (self attributeToChange value , ':') asSymbol.
	self linkedSpaceInterface view
		manipulationActionArguments: (Array with: self valueForAttribute value)"