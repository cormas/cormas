+ utilities - string
lowerCaseFirstChar: aString
	"Purpose: Converts the first character of of a string into uppercase
Example: Cormas lowerCaseFirstChar: 'Hello World'   "
	
	| copy |
	copy := aString species new: aString size.
	1
		to: aString size
		do:
			[:index | 
			index = 1
				ifTrue:
					[copy
						at: index
						put: (aString at: index) asLowercase]
				ifFalse:
					[copy
						at: index
						put: (aString at: index)]].
	^copy