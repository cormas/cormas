tests
testSortIncreasingly
	| n myblock|
	n := Cormas sortIncreasingly: #(10 20 58 96 48 76 57 68 19 10).
	myblock := n sortBlock.
	self assert: n equals: ((SortedCollection withAll: #(10 10 19 20 48 57 58 68 76 96)) sortBlock: myblock).