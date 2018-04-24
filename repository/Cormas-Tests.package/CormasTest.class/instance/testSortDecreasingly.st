tests
testSortDecreasingly
	| n myblock|
	n := Cormas sortDecreasingly: #(10 20 58 96 48 76 57 68 19 10).
	myblock := n sortBlock.
	self assert: n equals: ((SortedCollection withAll: #(96 76 68 58 57 48 20 19 10 10)) sortBlock: myblock ).