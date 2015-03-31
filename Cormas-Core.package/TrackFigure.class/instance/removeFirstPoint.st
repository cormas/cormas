removing
removeFirstPoint
	
	| isSelected |
	(isSelected := self isSelected)
		ifTrue: [self drawing deselectFigure: self].
	self pointsSize > 2 ifFalse: [^self].
	points removeFirst.	"self recomputePreferredBounds."
	isSelected ifTrue: [self drawing selectFigure: self]