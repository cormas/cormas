locate manually
createStopArcEntityOn: aStopCell
	
	| stopNode |
	stopNode := newArcInstance newEntity: newArcInstance stopNodeType.
	newArcInstance stopNode: stopNode.
	stopNode isMovedTo: aStopCell.
	newArcInstance
		isMovedFrom: newArcInstance startNode patch
		to: aStopCell.
	self isNbEntitiesToCreatePositive ifFalse: [self stopLocateManually].
	cormasModel updateEntities