tests
testRandomFloat
	| n |
	n := Cormas randomFloatFrom: -4.1 to: 2.5.
	self assert: n > -4.1 & (n < 2.5)