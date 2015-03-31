connection
connectFromPoint: myPoint to: aFigure at: figurePoint
	"Return a figure that represents the connection from self to aFigure (using myPoint
	and figurePoint as the connection points)."
	
	| newFigure |
	self model isAlreadyConnected
		ifTrue: [self cormas warn: 'Only one transition per activity']
		ifFalse:
			[newFigure := super connectFromPoint: myPoint to: aFigure at: figurePoint.
			newFigure model: ToolStateTransitionModel new.
			(newFigure model)
				from: self model;
				to: aFigure model.
			newFigure lineWidth: 2.
			self model connectToDestination: aFigure model.
			^newFigure]