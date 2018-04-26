manipulate
isTranslatedBy: aPoint
	"not moveable"
	
	self isMoveable ifTrue: [self translateBy: aPoint]