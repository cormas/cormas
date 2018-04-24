tests
testLowerCaseFirstChar
	| n |
	n := 'I Love Smalltalk'.
	self assert: (Cormas lowerCaseFirstChar: n) equals: 'i Love Smalltalk'.