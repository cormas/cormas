+ components - managing
addSynchronouslyComponent: anItem
	"Purpose: the given item will be added as a new component of the group when 'updateComponents' will be send to the receiver. Meanwhile, it is stored in the buffer attribute 'newComponents'
Argument: anItem = <Agent>"
	
	self newComponents add: anItem