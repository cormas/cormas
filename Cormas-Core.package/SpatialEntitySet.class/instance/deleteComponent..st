- control
deleteComponent: anItem
	"Purpose: removes a given component and notifies the change to dependents
Argument: anItem = <SpatialEntity>"
	
	self components
		remove: anItem
		ifAbsent: [].
	anItem compoundSpatialClasses
		at: self class name
		put: nil