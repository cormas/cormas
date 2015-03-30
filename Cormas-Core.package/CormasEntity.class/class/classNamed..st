+ utilities - classes
classNamed: aClassName
	"Purpose: returns a class of the model from its name.
Argument: aClassName = <ByteSymbol>
Return value: <class>"
	
	^self environment at: aClassName ifAbsent: nil