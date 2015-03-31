action
addSymbolPov: aString
	
	(super addSymbolPov: aString) ifNotNil: [self updateMenuAddSameAs].
	^aString