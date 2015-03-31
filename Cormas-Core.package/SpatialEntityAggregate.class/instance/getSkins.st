- accessing
getSkins
	"Returns a collection of collections of connected cells belonging 
	to the 'internal skin' of the aggregate"
	"The first coll contains the 'first' cell of the aggregat, ie. the top left cell"
	
	| sortedCells allSkins aColl aCell includedNeighCells |
	sortedCells := (self getSkinE asSortedCollection: [:a :b | a id < b id])
		copy.
	allSkins := OrderedCollection new.
	[sortedCells isEmpty]
		whileFalse:
			[aColl := OrderedCollection new.
			aCell := sortedCells first.
			includedNeighCells := OrderedCollection with: aCell.
			[includedNeighCells isEmpty or: [sortedCells isEmpty]]
				whileFalse:
					[aCell := sortedCells first.
					aColl add: aCell.
					sortedCells remove: aCell.
					includedNeighCells := aCell neighbourhood
						select: [:n | sortedCells includes: n].
					aColl addAll: includedNeighCells.
					sortedCells removeAll: includedNeighCells].
			allSkins add: aColl].
	^allSkins