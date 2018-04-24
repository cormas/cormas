tests
testNormalSigma
"Some time it fail :-)"
	|n|
	n := (Cormas normal: 5 sigma: 2).
	n > 5 
	ifTrue: [ self assert: n - 2 >= 5 ]
	ifFalse: [ self assert: n + 2 <= 5 ].