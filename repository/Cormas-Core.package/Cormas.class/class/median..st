+ utilities - mathematics
median: aCollectionOfNumbers
	"Answer the median of a numbers distribution. 
	The median is defined by :
		the element whose index is (N+1)/2, if N is odd	or
		the average of elements whose indexes are N/2 and 1+N/2, if N is even
aCollectionOfNumbers = < OrderedCollection> or <Array>
ex:		Cormas median: #( 1 2 3) 	=> 2
		Cormas median: #( 1 2 3 5) 	=> 2.5"
	
	| sortedColl |
	aCollectionOfNumbers size = 0 ifTrue: [^0].
	sortedColl := aCollectionOfNumbers asSortedCollection: [:a :b | a > b].
	sortedColl size odd
		ifTrue: [^sortedColl at: (sortedColl size + 1) / 2]
		ifFalse:
			[^((sortedColl at: sortedColl size / 2)
				+ (sortedColl at: sortedColl size / 2 + 1)) / 2]