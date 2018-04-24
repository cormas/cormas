tests
testDropBlanksFromString
	| n |
	n := 'I Love Smalltalk'.
	self assert: (Cormas dropBlanksFromString: n) equals: 'ILoveSmalltalk'.