+ components - managing
removeComponent: anItem
	"Purpose: removes a given component and notifies the change to dependents
Argument: anItem = <SpatialEntity>"
	
	self deleteComponent: anItem.
	self components isEmpty
		ifFalse:
			[self currentSimulation
				registerEntityChange: #compositionChanged
				with: (EntityReference onEntities: self components)
				from: (EntityReference on: self)]
		ifTrue:
			[self delete.
			self currentSimulation
				registerEntityChange: #removeEntity
				from: (EntityReference on: self)]