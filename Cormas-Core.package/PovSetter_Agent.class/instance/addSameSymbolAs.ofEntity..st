menu-symbol
addSameSymbolAs: aSymbolString ofEntity: aClass
	
	| aString |
	aString := super addSymbolPov.
	aString
		ifNotNil:
			[selectedClass povDict
				at: aString asSymbol
				put: (aClass povDict at: aSymbolString asSymbol) copy.
			self updateMenuAddSameAs.
			self listSymbolsChanged]