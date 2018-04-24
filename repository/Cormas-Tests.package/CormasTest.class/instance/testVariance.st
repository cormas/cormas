tests
testVariance

	| n |
	n := #(10 20 58 96 48 76 57 68 19 10).
	self assert: (Cormas variance: n) equals: 814.96.