- control
deleteComponents: aCollec
	"Purpose: removes a given collection of components and notifies the change to dependents
Argument: aCollec = <Collection(SpatialEntity)>
Example: self removeComponents: self getEpidermis"
	
	self components: self components - aCollec.
	aCollec
		do:
			[:c | 
			c compoundSpatialClasses
				at: self class name
				put: nil]