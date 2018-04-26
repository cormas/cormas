adding-removing
add: aFigure
	
	super add: aFigure.
	aFigure translateBy: self translationVector.
	aFigure scaleBy: self zoomFactor value