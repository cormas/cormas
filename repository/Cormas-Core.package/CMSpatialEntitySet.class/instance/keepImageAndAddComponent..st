- obsolete
keepImageAndAddComponent: cell
	"Purpose: silently adds a given component (do not notify the change to dependents)
Argument: aSpatialEntity = <SpatialEntity>"
	
	self addSilentlyComponent: cell