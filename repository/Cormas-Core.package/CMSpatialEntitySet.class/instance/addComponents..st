+ components - managing
addComponents: aCollecOfSpatialEntities
	"Purpose: adds a given aCollecOfSpatialEntities of components and notifies the change to dependents
Argument: aCollecOfSpatialEntities = <Collection(SpatialEntity)>
Example: self addComponents: self surround"
	
	self components addAll: aCollecOfSpatialEntities.
	aCollecOfSpatialEntities
		do:
			[:c | 
			c theCSE
				at: self class name
				put: self].
	self setSurround.
	self currentSimulation
		registerEntityChange: #compositionChanged
		with: (EntityReference onEntities: self components)
		from: (EntityReference on: self)