tests
testLowerCaseString
	| n |
	n := 'I Love Smalltalk'.
	self assert: (Cormas lowerCaseString: n) equals: 'i love smalltalk'.