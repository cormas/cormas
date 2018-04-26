+ utilities - methods - manipulation
methodsForControlNoArg
	"Purpose: returns a list of all the control methods with no argument
Return value: a collection of symbols"
	
	^self methodsForControl select: [:selector | (selector includes: $:) not]