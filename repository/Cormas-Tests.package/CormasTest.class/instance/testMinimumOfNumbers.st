tests
testMinimumOfNumbers
	| aCollection |
	aCollection := #(3 1 5 4 2).
	self assert: (Cormas min: aCollection) equals: 1