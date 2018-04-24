tests
testMax
	| n |
	n := #(10 20 58 96 48 76 57 68 19 10).
	self assert: (Cormas max: n) equals: 96