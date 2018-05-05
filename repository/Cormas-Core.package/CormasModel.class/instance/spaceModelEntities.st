accessing
spaceModelEntities

	^ self spaceModel ifNil: [ self alertMessage: 'The spaceModel is  not yet initialized'] ifNotNil: [:sm| sm spatialEntities values flattened asOrderedCollection]