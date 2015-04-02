+ utilities - string
removeFirstCharacterOfString: aString
	"Purpose: Remove the first character of aString. Answer a new String that is a copy of the argument, aString without the first character."
	
	| newString |
	newString := String new: aString size - 1.
	2
		to: aString size
		do:
			[:i | 
			newString
				at: i - 1
				put: (aString at: i)].
	^newString