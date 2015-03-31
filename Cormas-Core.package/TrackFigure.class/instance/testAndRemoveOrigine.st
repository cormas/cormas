removing
testAndRemoveOrigine
	
	TrackFigure maxSize <= 0 ifTrue: [^nil].
	[self pointsSize > (TrackFigure maxSize + 1)]
		whileTrue: [self removeFirstPoint]