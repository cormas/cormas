transforming
asCompositeFigure
	
	| aCompositeFigure |
	aCompositeFigure := CompositeEntityFigure new.
	aCompositeFigure add: self.
	aCompositeFigure entityType: self entityType.
	aCompositeFigure model: self model.
	^aCompositeFigure