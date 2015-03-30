+ components - managing
updateComponents
	"Purpose: use the buffered collections 'newComponents' and 'removedComponents' to update the group components instantaneously"
	
	self components addAll: self newComponents.
	self newComponents: OrderedCollection new.
	self components: self components - self removedComponents.
	self removedComponents: OrderedCollection new