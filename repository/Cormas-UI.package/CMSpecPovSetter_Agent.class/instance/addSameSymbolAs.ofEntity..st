adding
addSameSymbolAs: aSymbolString ofEntity: aClass
	
	| aString |
	(aString := self addSymbolPov) ifNotNil: [
		selectedClass povDict
			at: aString asSymbol
			put: (aClass povDict at: aSymbolString asSymbol) copy.
		self updateMenuAddSameAs.
		self listSymbolsChanged ]