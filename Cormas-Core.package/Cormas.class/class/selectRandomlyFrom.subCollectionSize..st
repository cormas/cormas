+ utilities - random
selectRandomlyFrom: aCollection subCollectionSize: anInteger
	"Purpose: Returns a subcollection randomly built from a collection (an item may be selected only once). If the collection is empty, or if the collection size is lower than the subcollection size, its returns aCollection randomly mixed..
Examples: Cormas selectRandomlyFrom: (Set withAll: #(1 2 3 4 5)) subCollectionSize: 3 => OrderedCollection (4 5 1)
			self ask: (Cormas selectRandomlyFrom: (self theCells select:[:c| c state = #tree]) subCollectionSize: 4) toDo: #burn"
	
	| randomCollection |
	anInteger < 1 ifTrue: [^OrderedCollection new].
	randomCollection := Cormas mixt: aCollection.
	randomCollection size <= anInteger ifTrue: [^randomCollection].
	^randomCollection copyFrom: 1 to: anInteger