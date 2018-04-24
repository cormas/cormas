tests
testCountInto
	| n |
	n := #(1 2 3 4 5 6 7 8 8 8 8 8 ).
	self assert: (Cormas count: 8 into: n) equals: 5.