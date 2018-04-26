private - regular cells - instance creation
eastCell: k
	
	k \\ column = 0 ifFalse: [^k + 1].
	boundaries == #torroidal ifTrue: [^k - (column - 1)].
	^0