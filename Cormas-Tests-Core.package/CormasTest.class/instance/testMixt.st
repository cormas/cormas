tests
testMixt
	| aCollection |
	aCollection := #(1 2 3 4 5).
	self assert: ((CormasOld mixt: aCollection) includes: 1)