accessing
removeAnnotation: aLineAnnotation
	
	annotations := annotations copyWithout: aLineAnnotation.
	aLineAnnotation container: nil.
	self recomputePreferredBounds