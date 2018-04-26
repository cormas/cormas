landscape indices
meanCompactness: aClass
	
	| sum aggregates |
	aggregates := self cormasModel
		perform: ('the' , aClass name asString , 's') asSymbol.
	sum := aggregates
		inject: 0
		into: [:cumul :aggreg | cumul + aggreg updateCompactness].
	^aggregates size = 0
		ifTrue: [0]
		ifFalse: [sum / aggregates size]