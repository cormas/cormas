+ components - managing
addSilentlyComponents: aCollecOfSpatialEntities
	"Purpose: adds silently a given aCollecOfSpatialEntities of components (do not notify the change to dependents and do not recalulate the surrounding)
Argument: aCollecOfSpatialEntities = <Collection(SpatialEntity)>
Example: self addSilentlyComponents: self surround"
	
	self components addAll: aCollecOfSpatialEntities.
	aCollecOfSpatialEntities
		do:
			[:c | 
			c theCSE
				at: self class name
				put: self]