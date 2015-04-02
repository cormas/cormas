+ utilities - string
lowerCaseString: aString
	"Purpose: Converts all uppercase characters of a string into lowercase characters
Example: Cormas lowerCaseString: 'Hello World'   "
	
	| ws |
	ws := WriteStream on: (aString species new: aString size).
	1
		to: aString size
		do:
			[:i | 
			| c |
			c := aString at: i.
			ws
				nextPut:
					(c isUppercase
						ifFalse: [c]
						ifTrue: [c asLowercase])].
	^ws contents