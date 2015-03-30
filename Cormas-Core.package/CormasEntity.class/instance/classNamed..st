+ accessing
classNamed: aClassName
	"Purpose: returns a class from its name
Argument: aClassName = <ByteSymbol>
Return value: a class
Example: self classFromSymbol: (self bestOpponent strategy, 'Forager', ) asSymbol"
	
	^self class classFromSymbol: aClassName