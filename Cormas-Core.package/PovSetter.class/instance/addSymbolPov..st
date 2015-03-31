action
addSymbolPov: aString
	
	| aList |
	(self listSymbols list includes: aString)
		ifTrue:
			[^Cormas current
				warn:
					(UserMessage defaultString: 'This symbol already exists !!!' key:
							#alreadyExistingSymbol) asString].
	aList := listSymbols list copy.
	aList add: aString.
	aList sort.
	self listSymbols setList: aList selecting: aString.
	selectedClass colorsDict
		at: aString asSymbol
		put: selectedClass defaultColor.
	^aString