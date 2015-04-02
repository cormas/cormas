+ utilities - collection
sortDecreasingly: aCollectionOfNumbers
	"Purpose: sort the elements of a collection in an decreasing order
Argument: aCollectionOfNumbers = < OrderedCollection> or <Array>
Return value: a sorted collection
Example: Cormas sortDecreasingly: #( 2 1 3)	=> aSortedCollection (3 2 1)"
	
	^aCollectionOfNumbers asSortedCollection: [:a :b | a > b]