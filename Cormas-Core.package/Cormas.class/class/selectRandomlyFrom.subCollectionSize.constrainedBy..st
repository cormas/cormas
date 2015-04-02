+ utilities - random
selectRandomlyFrom: aCollection subCollectionSize: anInteger constrainedBy: aBlock
	"Purpose: Returns a subcollection, which elements satisfies the condition aBlock and are randomly picked from aCollection (an element may be selected only once). If aCollection is empty, or if the number of elements satisfying the condition aBlock is lower than the subcollection size, its returns a collection of elements satsisfying the condition randomly mixed..
Examples: Cormas selectRandomlyFrom: (Set withAll: #(1 2 3 4 5)) subCollectionSize: 3  constrainedBy: [:i | i > 2].
			self ask: (Cormas selectRandomlyFrom: self theCells subCollectionSize: 4 constrainedBy: [:c| c state = #tree]) toDo: #burn"
	
	| randomCollection |
	anInteger < 1 ifTrue: [^OrderedCollection new].
	randomCollection := Cormas mixt: (aCollection select: aBlock).
	randomCollection size <= anInteger ifTrue: [^randomCollection].
	^randomCollection copyFrom: 1 to: anInteger