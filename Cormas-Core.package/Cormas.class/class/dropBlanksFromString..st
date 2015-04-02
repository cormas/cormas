+ utilities - string
dropBlanksFromString: aString
	"Purpose: Returns a copy of aString without any space characters
Example: Cormas dropBlanksFromString: 'Hello World    '    "
	
	| ws |
	ws := WriteStream on: (aString species new: aString size).
	1
		to: aString size
		do:
			[:i | 
			| c |
			c := aString at: i.
			c = $  ifFalse: [ws nextPut: c]].
	^ws contents