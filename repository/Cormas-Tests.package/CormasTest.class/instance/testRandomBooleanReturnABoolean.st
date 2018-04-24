tests
testRandomBooleanReturnABoolean
	| aBoolean |
	aBoolean := Cormas randomBoolean.
	self assert: (aBoolean or: [ aBoolean not ])