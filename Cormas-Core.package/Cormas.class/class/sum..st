+ utilities - mathematics
sum: aCollectionOfNumbers
	"Purpoose: Answer the summation of a set of numbers. 
Argument: aCollectionOfNumbers = < OrderedCollection> or <Array>
Example: Cormas sum: #( 1 2 3)	=> 6"
	
	^aCollectionOfNumbers
		inject: 0
		into: [:subTotal :next | subTotal + next]