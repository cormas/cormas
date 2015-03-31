+ components - managing
removeComponents: aCollec
	"Purpose: removes a given collection of components and notifies the change to dependents
Argument: aCollec = <Collection(SpatialEntity)>
Example: self removeComponents: self getEpidermis"
	
	self deleteComponents: aCollec.
	self components isEmpty
		ifFalse:
			[self currentSimulation
				registerEntityChange: #compositionChanged
				with: (EntityReference onEntities: self components)
				from: (EntityReference on: self)]
		ifTrue: [self delete]