- accessing
getLinkedCellsOf: aCollectionOfCells
	"returns a collection of collections. Each subcollection contains connected cells"
	
	| bigColl allCells subColl coll |
	bigColl := OrderedCollection new.
	allCells := aCollectionOfCells copy.
	subColl := OrderedSet new.
	[allCells isEmpty]
		whileFalse:
			[subColl isEmpty ifTrue: [subColl add: allCells first].
			coll := (self neighborsOf: subColl) select: [:n | allCells includes: n].
			coll isEmpty
				ifFalse: [subColl addAll: coll]
				ifTrue:
					[bigColl add: subColl.
					allCells removeAll: subColl.
					subColl := OrderedSet new]].
	^bigColl