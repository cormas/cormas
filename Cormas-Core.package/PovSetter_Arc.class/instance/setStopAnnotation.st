changed
setStopAnnotation
	
	self stopAnnotation value
		ifTrue: [imageOS figure addStopArrow]
		ifFalse: [imageOS figure removeArrow].
	imageOS invalidate.
	self imageOS model stopAnnotation: self stopAnnotation value.
	(self builder componentAt: #boutonAppliquer) enable