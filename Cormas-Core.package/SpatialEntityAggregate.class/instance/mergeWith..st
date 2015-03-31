+ components - managing
mergeWith: otherAggregate
	"Purpose: merges a givern aggregate with the receiver whose surround is then reset
Argument: otherAggregate = <SpatialEntityAggregate>"
	
	self components addAll: otherAggregate components.
	self setSurround