+ components - managing
deleteSynchronouslyComponent: anItem
	"Purpose: the given item will be removed from the group components when 'updateComponents' will be send to the receiver. Meanwhile, it is stored in the buffer attribute 'removedComponents'
Argument: anItem = <Agent>"
	
	self removedComponents add: anItem