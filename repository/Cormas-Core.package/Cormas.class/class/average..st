+ utilities - mathematics
average: aCollectionOfNumbers
	"Purpose: Returns the average of set of numbers
Argument: aCollectionOfNumbers = < OrderedCollection> or <Array>
Example: Cormas averageOf: #( 1 2 3)  	=> 2.0 "
	
	aCollectionOfNumbers size = 0 ifTrue: [^0].
	^((aCollectionOfNumbers
		inject: 0
		into: [:subTotal :next | subTotal + next]) / aCollectionOfNumbers size)
		asFloat