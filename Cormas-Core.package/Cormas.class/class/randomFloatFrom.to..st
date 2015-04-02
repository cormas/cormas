+ utilities - random
randomFloatFrom: startNumber to: endNumber
	"Purpose: Return a random float between 'startNumber' and 'endNumber' (excluding startNumber and endNumber): 
	startNumber < randomFloat < endNumber, ie. randomFloat ‚Ç¨ ]startNumber ; endNumber[.
Examples: Cormas randomFloatFrom: 0 to: 10.
		Cormas randomFloatFrom: -4.1 to: 2.5
		10 timesRepeat: [Cormas randomFloatFrom: 1.1 to: 2.9] => (2.19661 1.78905 1.19457 1.96943 1.6194 1.12104 1.94028 2.41498 2.19254 2.18504) "
	
	| extent result |
	extent := endNumber asRational - startNumber asRational.
	result := (Cormas random * extent + startNumber asRational) asFloat.
	^result = endNumber
		ifTrue: [self randomFloatFrom: startNumber to: endNumber]
		ifFalse: [result]