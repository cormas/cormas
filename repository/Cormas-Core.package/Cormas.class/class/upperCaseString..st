+ utilities - string
upperCaseString: aString
	"Purpose: Converts all lowercase characters of a string into uppercase characters
Example: Cormas upperCaseString: 'Hello World'   "
	
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
					(c isLowercase
						ifFalse: [c]
						ifTrue: [c asUppercase])].
	^ws contents