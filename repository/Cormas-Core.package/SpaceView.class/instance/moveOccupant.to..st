adapting
moveOccupant: occupantFigure to: absolutePoint
	"Move origin of occupantFigure to aPoint x scaleFactor."
	
	| lineFigures |
	"add a new point to the tracker as the last position"
	lineFigures := occupantFigure dependents
		select: [:f | f isKindOf: TrackFigure].
	lineFigures
		do:
			[:lf | 
			lf
				addPoint: occupantFigure center
				beforeIndex: lf pointsSize.
			lf testAndRemoveOrigine].	"move the figure"
	occupantFigure translateTo: absolutePoint * self scaleFactor