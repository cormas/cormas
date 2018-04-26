+ utilities - string
dropBlanksFromString: aString
	"Purpose: Returns a copy of aString without any space characters
Example: Cormas dropBlanksFromString: 'Hello World    ' => 'HelloWorld'"

	^ aString copyWithRegex: ' ' matchesReplacedWith: ''