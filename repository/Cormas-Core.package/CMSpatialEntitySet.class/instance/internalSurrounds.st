+ accessing
internalSurrounds
	"Returns a collection of internal cells that surround the aggregate (only the cells located into the aggregate)"
	
	| allSurrounds linkedCells edgeCells |
	allSurrounds := self surround
		asSortedCollection: [:c1 :c2 | c1 id < c2 id].	"on r√©cup√®re des files de cellules connect√©es"
	linkedCells := self getLinkedCellsOf: allSurrounds.	"on test si il y a des files de cellules en contact avec le bord"
	edgeCells := linkedCells select: [:coll | coll contains: [:c | c edge]].
	edgeCells isEmpty
		ifTrue: [linkedCells removeFirst]
		ifFalse: [linkedCells removeAll: edgeCells].
	^linkedCells