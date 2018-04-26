+ accessing
externalSurround
	"Returns a collection of cells that surround the aggregate, WITHOUT included cells located into the aggregate"
	
	| allSurrounds linkedCells edgeCells externalSurround |
	self internalLines isEmpty ifTrue: [^self surround].
	allSurrounds := self surround
		asSortedCollection: [:c1 :c2 | c1 id < c2 id].	"on test si il y a des files de cellules en contact avec le bord"
	linkedCells := self getLinkedCellsOf: allSurrounds.
	edgeCells := linkedCells select: [:coll | coll contains: [:c | c edge]].
	edgeCells isEmpty
		ifTrue: [^linkedCells first]
		ifFalse:
			[externalSurround := OrderedCollection new.
			edgeCells do: [:coll | externalSurround addAll: coll]].
	^externalSurround