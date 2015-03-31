private - regular cells - instance creation
northCell: k
	
	k = 0 ifTrue: [^0].
	k > column ifTrue: [^k - column].
	boundaries == #torroidal ifTrue: [^column * (line - 1) + k].
	^0