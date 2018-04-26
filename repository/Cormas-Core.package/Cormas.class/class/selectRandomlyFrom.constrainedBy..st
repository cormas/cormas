+ utilities - random
selectRandomlyFrom: aCollection constrainedBy: aBlock
	"Purpose: Returns an item satisfying the condition aBlock at randomly position of the collection 'aCollection'. 
If the collection is empty, or no item satisfies the condition aBlock, its returns nil.
Example:  Cormas selectRandomlyFrom: (List withAll: #(1 2 3 4 5)) constrainedBy: [:i | i > 2].
Example:  Cormas selectRandomlyFrom: self thePersons constrainedBy: [:p | p  age <  42] "
	
	| x collec2 |
	collec2 := aCollection select: aBlock.
	collec2 isEmpty ifTrue: [^nil].
	x := self
		randomFrom: 1
		to: collec2 size.
	^collec2 asOrderedCollection at: x