+ procedures
moveStartNodeTo: aSpatialEntityElement
	"the startNode of the Arc is moved to aSpatialEntityElement.
	aSpatialEntityElement = <SpatialEntityElement>"
	
	self startNode destroyed: false.
	self startNode patch = aSpatialEntityElement ifTrue: [^nil].
	self startNode isMovedTo: aSpatialEntityElement