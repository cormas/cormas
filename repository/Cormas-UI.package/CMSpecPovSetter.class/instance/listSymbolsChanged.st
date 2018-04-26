changed
listSymbolsChanged
	
	| aPov |
	self listSymbols selection ifNil: [^nil].
	aPov := self listSymbols selection asSymbol.
	(self selectedClass colorAtPov: aPov)
		ifNil:
			[self selectedClass colorsDict
				at: aPov
				put: selectedClass defaultColor].
	couleur := self selectedClass colorAtPov: aPov.
	self updateSlidersFromColor: couleur.
	^couleur