tests
testSelectRandomlyFrom
	| aCollection |
	aCollection := #(1 2 3 4 5).
	self assert: (aCollection includes: (Cormas selectRandomlyFrom: aCollection))