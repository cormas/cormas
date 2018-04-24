tests
testMedian
"in R with median(c(10,20,58,96,48,76,57,68,19,10)), return
[1] 52.5
"
	| n |
	n := #(10 20 58 96 48 76 57 68 19).
	self assert: (Cormas median: n) equals: 57.