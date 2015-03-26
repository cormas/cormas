connection
connectFromPoint: myPoint to: aFigure at: figurePoint
	"Return a figure that represents the connection from self to aFigure (using myPoint
	and figurePoint as the connection points)."
	
	| newFigure |
	newFigure := super connectFromPoint: myPoint to: aFigure at: figurePoint.
	newFigure model: ToolStateTransitionModel new.
	(newFigure model)
		from: self model;
		to: aFigure model.
	newFigure lineWidth: 2.
	self model outgoingTrue isNil
		ifTrue:
			["newFigure entityType: 'transition_TRUE'."
			newFigure setText: '[true]'.
			newFigure lineColor: ColorValue green.
			self model connectToDestinationTrue: aFigure model]
		ifFalse:
			["newFigure entityType: 'transition_FALSE'."
			newFigure setText: '[false]'.
			newFigure lineColor: ColorValue red.
			self model connectToDestinationFalse: aFigure model].
	^newFigure