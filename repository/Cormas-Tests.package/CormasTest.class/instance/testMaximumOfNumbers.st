tests
testMaximumOfNumbers
	| aCollection |
	aCollection := #(3 1 5 4 2).
	self assert: (Cormas max: aCollection) equals: 5