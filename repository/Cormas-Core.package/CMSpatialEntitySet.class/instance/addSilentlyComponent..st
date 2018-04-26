+ components - managing
addSilentlyComponent: cell
	"Purpose: silently adds a given component (do not notify the change to dependents and do not recalulate the surrounding)
Argument: aSpatialEntity = <SpatialEntity>
Example: self addSilentlyComponent: aCell"
	
	cell compoundSpatialClasses
		at: self class name
		put: self.
	self components add: cell