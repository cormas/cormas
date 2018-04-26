changed
listMethodsChanged
	"some methods has changed. Propagate the changed to the spaceModel for its spaceInterfaces.
	(added while removing spaceInterfaces"
	
	self spaceModel ifNotNil: [:sm | sm listMethodsChanged]