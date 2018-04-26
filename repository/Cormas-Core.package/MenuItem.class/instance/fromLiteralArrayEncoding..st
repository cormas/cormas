private
fromLiteralArrayEncoding: anArray
	"Initialize the receiver with the information in the literalArray (see literalArrayEncoding).

	The perform: argument is checked for #value: to allow the value of the
 	MenuItem to be an array, i.e. not decoded."
	
	2
		to: anArray size
		by: 2
		do:
			[:i | 
			| symbol |
			symbol := anArray at: i.
			symbol == #value:
				ifTrue: [self value: (anArray at: i + 1)]
				ifFalse:
					[self
						perform: symbol
						with: (anArray at: i + 1) decodeAsLiteralArray]]