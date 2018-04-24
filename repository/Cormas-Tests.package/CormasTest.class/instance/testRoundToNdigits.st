tests
testRoundToNdigits
"In R round(4.8750654, digits = 2)
[1] 4.88
"
	self assert: (Cormas round: 4.8750654 toNdigits:  2) equals: 4.88. 