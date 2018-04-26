private - regular cells - instance creation
southCell: k
	
	k = 0 ifTrue: [^0].
	k <= (column * (line - 1)) ifTrue: [^k + column].
	boundaries == #torroidal ifTrue: [^k - (column * (line - 1))].
	^0