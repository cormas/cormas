+ procedures
moveStopNodeTo: aSpatialEntityElement
	"the startNode of the Arc is moved to aSpatialEntityElement.
	aSpatialEntityElement = <SpatialEntityElement>"
	
	self stopNode patch = aSpatialEntityElement ifTrue: [^nil].
	self stopNode isMovedTo: aSpatialEntityElement