click
selection: aFigure
	
	aFigure isSelected ifFalse: [^super selection: aFigure].
	self clearSelections