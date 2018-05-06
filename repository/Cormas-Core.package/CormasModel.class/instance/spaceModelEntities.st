accessing
spaceModelEntities

	^ self spaceModel ifNotNil: [:sm| sm spatialEntities values flattened asOrderedCollection]