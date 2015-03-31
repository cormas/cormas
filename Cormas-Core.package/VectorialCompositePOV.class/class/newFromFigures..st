instance creation
newFromFigures: aSetOfFigures
	"Recursivite, non test√© !!!!"
	
	| inst aSetOfImages |
	inst := self new.
	aSetOfImages := aSetOfFigures
		collect:
			[:figure | 
			(figure isKindOf: CompositeFigure)
				ifTrue: [VectorialCompositePOV newFromFigures: figure components]
				ifFalse:
					[VectorialElementaryPOV
						new:
							((Polyline vertices: figure points) translatedBy: figure center negated)]].
	inst addAll: aSetOfImages.
	^inst