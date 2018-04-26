util
removeParentheses: aNom
	"inutile avec Cormas2000"
	
	| index unNom |
	aNom isNil ifTrue: [^nil].
	index := aNom findFirst: [:aChar | aChar = $(].
	unNom := aNom
		changeFrom: index - 1
		to: aNom size
		with: ''.
	^unNom