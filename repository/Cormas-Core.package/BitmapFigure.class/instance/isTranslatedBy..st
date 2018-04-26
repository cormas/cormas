manipulate
isTranslatedBy: aPoint
	
	self isMoveable ifTrue: [self translateBy: aPoint]