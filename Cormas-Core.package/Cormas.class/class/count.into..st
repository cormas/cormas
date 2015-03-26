+ utilities - mathematics
count: element into: aCollection
	"Purpose: Return a value indicating the number of occurrence of 'element' from aCollection. 
Argument: aCollectionOfNumbers = < OrderedCollection> or <Array>
Examples: Cormas count: 3 into: #( 1 2 3 3 3 3 3) 	 => 5
			Cormas count: 'a' into: #( 1 2 3 3 3 3 3) 	 => 0"
	
	^(aCollection select: [:anElement | element = anElement]) size