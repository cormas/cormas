aVirer
selectFigure22: aFigure
	
	self halt.
	aFigure isSelected
		ifFalse: [super selectFigure: aFigure]
		ifTrue: [self deselectFigure: aFigure]