accessing
addAnnotation: aLineAnnotation
	
	annotations := annotations copyWith: aLineAnnotation.
	aLineAnnotation container: self.
	self recomputePreferredBounds