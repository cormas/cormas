private - regular cells - instance creation
westCell: k
	
	k \\ column = 1 ifFalse: [^k - 1].
	boundaries == #torroidal ifTrue: [^k + column - 1].
	^0