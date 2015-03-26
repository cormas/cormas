+ accessing - spatial grid
openedSpatialGrid
	"Purpose: Return the last opened spatial grid"
	
	| spatialGrids |
	spatialGrids := self openedSpatialGrids.
	^spatialGrids isEmpty
		ifTrue: [nil]
		ifFalse: [spatialGrids last]