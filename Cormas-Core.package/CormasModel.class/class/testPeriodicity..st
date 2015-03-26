+ testing - scheduling
testPeriodicity: anInteger
	"Purpose: To test if the curent time step is a multiple of the periodicity defined by anInteger. Can be used by any entity of the model. 
Return value: aBoolean
Example: (MyModel testPeriodicity: 12) ifTrue:[self  calculateAnnualBalance]"
	
	^self timeStep \\ anInteger = 0