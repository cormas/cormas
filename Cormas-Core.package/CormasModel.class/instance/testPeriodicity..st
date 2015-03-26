+ testing - scheduling
testPeriodicity: anInteger
	"Purpose: To test if the curent time step is a multiple of the periodicity defined by anInteger
Return value: aBoolean
Example: (self testPeriodicity: 12) ifTrue:[self theFarmers do:[:f| f calculateAnnualBalance]]"
	
	^self class testPeriodicity: anInteger