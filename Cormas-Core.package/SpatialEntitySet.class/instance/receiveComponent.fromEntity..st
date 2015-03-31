+ components - managing
receiveComponent: x fromEntity: y
	"Purpose: performs an exchange of component among the receiver and another spatial entity made of same kind of lower level spatial entities
Arguments: x = <SpatialEntity>
			y = <SpatialEntitySet>"
	
	y removeComponent: x.
	self addComponent: x