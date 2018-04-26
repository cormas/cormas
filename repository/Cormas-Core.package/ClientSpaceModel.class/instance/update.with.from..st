updating
update: anAspectSymbol with: aParameter from: aSender
	
	anAspectSymbol = #openedSpatialGridsForHabitus:
		ifTrue: [^self changed: anAspectSymbol with: aParameter].	" hack : avoid isKindOf: when getting SpaceInterface from openedSpatialGrid"
	anAspectSymbol = #timeChanged
		ifTrue: [^self changed: anAspectSymbol with: aParameter].
	anAspectSymbol = #noticeChanges
		ifTrue:
			[aParameter isEmpty ifTrue: [^self].
			^self changed: #noticeChanges with: aParameter].
	anAspectSymbol = #noticeChange
		ifTrue: [^self changed: #noticeChange with: aParameter].
	anAspectSymbol = #createCellsPovWithReferences
		ifTrue: [^self createCellsPovWithReferences: aParameter]