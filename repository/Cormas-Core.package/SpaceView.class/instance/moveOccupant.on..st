adding-removing
moveOccupant: aSituatedEntityReference on: aESEreference
	"First detects the figure that match aSituatedEntityReference on this spaceView
	Then move that figure to its new location by requesting the patch of this entity.
	It also calculates the position of the figure on the SpatialEntity by requesting 'position' to the corresponding Pov"
	
	| aFig absolutePoint absolutePatchBounds |
	aFig := self findRegisteredFigureFor: aSituatedEntityReference.
	aFig
		ifNil:
			[aFig := self findFigureFor: aSituatedEntityReference.
			aFig ifNil: [^nil]].
	absolutePatchBounds := (self spaceModel elementaryEntitiesDefaultPovs
		at: aESEreference entityId) bounds.
	absolutePoint := aFig calculateNewPositionOnPatchBounds:
			absolutePatchBounds.
	aFig moveTo: absolutePoint