navigation
incrChar: aChar
	
	| nextChar |
	nextChar := (aChar asInteger + 1) asCharacter.
	nextChar isAlphabetic ifFalse: [^$A].
	^nextChar