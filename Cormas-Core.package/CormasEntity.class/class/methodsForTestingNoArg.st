+ utilities - methods - manipulation
methodsForTestingNoArg
	"Purpose: returns a list of all the testing methods with no argument
Return value: a collection of symbols"
	
	^self methodsForTesting select: [:selector | (selector includes: $:) not]