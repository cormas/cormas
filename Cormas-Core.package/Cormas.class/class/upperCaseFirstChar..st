+ utilities - string
upperCaseFirstChar: aString
	"Purpose: Converts the first character of of a string into uppercase
Example: Cormas upperCaseFirstChar: 'hello World'   "
	
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
						put: (aString at: index) asUppercase]
				ifFalse:
					[copy
						at: index
						put: (aString at: index)]].
	^copy