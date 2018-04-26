interact with spaceInterface
updateInstancesSelectionWith: collecOfInstances lastSelected: anInstance
	
	self entityClass ~= anInstance class
		ifTrue: [self entity value: anInstance class name asString].
	self selectedEntities: collecOfInstances.
	self nbEntitiesSelected value: self selectedEntities size.
	self isSituatedEntity
		ifTrue:
			[self nbEntitiesSelectedSituated
				value: (self selectedEntities select: [:a | a isSituated]) size].
	self testElement value: 'id'.
	self operator value: '='.
	self testValue value: anInstance id