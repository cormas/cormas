tests
testInterquartileRange
"in R with IQR(c(0,10,20,58,96,48,76,57,68,19,10), type = 1), return
[1] 58"
	| n |
	n := #(10 20 58 96 48 76 57 68 19 10).
	self assert: (Cormas interquartileRange: n) equals: 49.