+ utilities - methods - manipulation
methodsForInitNoArg
	"Purpose: returns a list of all the init methods with no argument
Return value: a collection of symbols"
	
	^self methodsForInit select: [:selector | (selector includes: $:) not]