adding
addPoint: aPoint
	
	points := points copyWith: aPoint.
	self updatePreferredBoundsWith: aPoint.
	^aPoint