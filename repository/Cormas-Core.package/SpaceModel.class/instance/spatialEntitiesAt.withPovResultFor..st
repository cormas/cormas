accessing
spatialEntitiesAt: aSpatialEntityName withPovResultFor: povSelector
	"return spatialEntities associated with their povResult for a povSelector.
	this is an optimised method sp√©cially for remote access"
	
	^(self spatialEntities at: aSpatialEntityName) asOrderedCollection
		collect: [:each | each -> (each getPovResultFor: povSelector)]