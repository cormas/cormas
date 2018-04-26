action
removeSymbolPov
	
	| aString |
	aString := super removeSymbolPov.
	aString
		ifNotNil:
			[selectedClass povDict
				removeKey: aString asSymbol
				ifAbsent: [nil].
			self updateMenuAddSameAs]