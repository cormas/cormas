+ utilities - collection
sortIncreasingly: aCollectionOfNumbers
	"Purpose: sort the elements of a collection in an increasing order
Argument: aCollectionOfNumbers = < OrderedCollection> or <Array>
Return value: a sorted collection
Example: Cormas sortIncreasingly: #( 2 1 3)	=> aSortedCollection (1 2 3)"
	
	^aCollectionOfNumbers asSortedCollection: [:a :b | a < b]