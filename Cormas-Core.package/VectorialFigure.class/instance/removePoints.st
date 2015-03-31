removing
removePoints
	
	self isSelected ifTrue: [self drawing deselectFigure: self].
	points size > 2 ifFalse: [^self].
	points := Array new