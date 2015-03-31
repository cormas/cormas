tests
testRandomReturnAValueBetweenZeroAndOne
	self assert: CormasOld random > 0.
	self assert: CormasOld random <= 1