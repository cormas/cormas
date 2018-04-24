tests
testSumOfNumbers
	| aCollection |
	aCollection := #(3 1 5 4 2).
	self assert: (Cormas sum: aCollection) equals: 15