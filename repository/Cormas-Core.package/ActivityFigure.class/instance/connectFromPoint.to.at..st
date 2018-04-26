connection
connectFromPoint: myPoint to: aFigure at: figurePoint
	"Return a figure that represents the connection from self to aFigure (using myPoint
	and figurePoint as the connection points)."
	
	| newTransitionFigure |
	newTransitionFigure := super connectFromPoint: myPoint to: aFigure at:
			figurePoint.
	newTransitionFigure model: ToolStateTransitionModel new.
	(newTransitionFigure model)
		from: self model;
		to: aFigure model.
	newTransitionFigure lineWidth: 2.
	self model connectToDestination: aFigure model.
	^newTransitionFigure