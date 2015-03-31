+ components - managing
addComponent: aSpatialEntity
	"Purpose: adds a given component and notifies the change to dependents
Argument: aSpatialEntity = <SpatialEntity>"
	
	aSpatialEntity compoundSpatialClasses
		at: self class name
		put: self.
	self components add: aSpatialEntity.
	self setSurround.
	self currentSimulation
		registerEntityChange: #compositionChanged
		with: (EntityReference onEntities: self components)
		from: (EntityReference on: self)