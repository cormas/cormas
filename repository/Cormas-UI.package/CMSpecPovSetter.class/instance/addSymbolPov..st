action
addSymbolPov: aString
	| aList |
	(self listSymbols list includes: aString)
		ifTrue: [ ^ self alertMessage: self translator tSymbolAlreadyExists ].
	aList := listSymbols list copy.
	aList add: aString.
	aList sort.
	self listSymbols setList: aList selecting: aString.
	selectedClass colorsDict
		at: aString asSymbol
		put: selectedClass defaultColor.
	^ aString