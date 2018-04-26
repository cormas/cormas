menus
addAsProbeAttribute: attributeName
	
	(Cormas current confirm: self attributeIsNumber)
		ifTrue: [self moveFromAccessToProbes: attributeName]
		ifFalse: [self modifyProbeFromAttribute: attributeName]