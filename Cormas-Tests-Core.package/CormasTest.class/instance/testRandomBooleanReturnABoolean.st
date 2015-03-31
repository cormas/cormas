tests
testRandomBooleanReturnABoolean
	| aBoolean |
	aBoolean := CormasOld randomBoolean.
	self assert: (aBoolean or: [ aBoolean not ])