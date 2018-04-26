accessing
convertStringAsList: aString
	"ex: 'List (1 2 5)'  --> "
	
	| arrayOfSubstrings list nb newString |
	newString := aString copyReplaceAll: '(' with: ''.
	newString := newString copyReplaceAll: ')' with: ''.
	(newString includes: $;)
		ifTrue:
			[newString := newString copyReplaceAll: ' ' with: ''.
			arrayOfSubstrings := newString asArrayOfSubstringsSeparatedBy: $;]
		ifFalse: [arrayOfSubstrings := newString asArrayOfSubstrings].
	list := List new.
	arrayOfSubstrings
		do:
			[:st | 
			nb := Cormas stringAsObjectType: st.
			nb cormasHelper isTypeNumber ifTrue: [list add: nb]].
	^list