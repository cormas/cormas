+ components - managing
receiveComponents: aCollec fromEntity: y
	"Purpose: performs an exchange of components among the receiver and another spatial entity made of same kind of lower level spatial entities
Arguments: aCollec = <Collection(SpatialEntity)>
			y = <SpatialEntitySet>"
	
	y removeComponents: aCollec.
	self addComponents: aCollec