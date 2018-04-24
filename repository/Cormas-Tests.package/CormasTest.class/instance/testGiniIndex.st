tests
testGiniIndex
"in R with ineq package c(10,20,58,96,48,76,57,68,19,10), return
[1] 0.3471861
Cormas giniIndexOf: #(10 20 58 96 48 76 57 68 19 10) => 34.71861
ok
"
	| n |
	n := #(10 20 58 96 48 76 57 68 19 10).
	self assert: (Cormas giniIndexOf: n) equals: 8020/231