changed
setStartAnnotation
	
	self startAnnotation value
		ifTrue: [imageOS figure addCircleStart]
		ifFalse: [imageOS figure removeCircle].
	imageOS invalidate.
	self imageOS model startAnnotation: self startAnnotation value.
	(self builder componentAt: #boutonAppliquer) enable