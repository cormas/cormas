util
removeBrackets: aNom
	
	| index unNom |
	aNom isNil ifTrue: [^nil].
	index := aNom findFirst: [:aChar | aChar = $(].
	index = 0 ifTrue: [^aNom].
	unNom := aNom
		changeFrom: index - 1
		to: aNom size
		with: ''.
	^unNom