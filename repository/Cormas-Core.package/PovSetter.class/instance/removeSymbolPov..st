action
removeSymbolPov: aString
	
	| aList i |
	i := listSymbols list indexOf: aString.
	aList := listSymbols list copy.
	aList remove: aString.
	self listSymbols
		setList: aList
		selecting: (aList at: (i min: aList size))