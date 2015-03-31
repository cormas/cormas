actions
install
	
	| figure |
	(Dialog confirm:
			'You are about to change the image. The relative size will be set to 100% and the position on the cell will be at center.
Do you want to continue?') ifFalse: [^nil].
	figure := self drawing components first.
	figure translateTo: self drawing origin.
	figure scaleBy: 0.5.
	(figure isKindOf: CompositeFigure)
		ifTrue:
			[figure model: (VectorialCompositePOV newFromFigures: figure components)]
		ifFalse:
			[figure
				model:
					(VectorialElementaryPOV
						new:
							((Polyline vertices: figure points) translatedBy: figure center negated))].
	figure model color: figure fillColor.
	figure model isStroked: figure isOpaque not.
	figure model sizeRatio: 1.	"(scaleFactor x max: scaleFactor y)"
	figure model lineWidth: figure lineWidth.
	figure model lineColor: figure lineColor.
	observer setNewVectorialImage: figure model.
	self closeAndUnschedule