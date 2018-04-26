grid recorder
screenImage
	
	| cursorPoint aCursor cursorImage hotSpot figureImage shapeImage anImage theY theX coverageValue colorValue paletteIndex |
	cursorPoint := InputSensor cursorPoint - self spatialGridArea origin.
	aCursor := Cursor currentCursor.
	cursorImage := aCursor asOpaqueImage.
	hotSpot := aCursor
		instVarAt: (aCursor class allInstVarNames indexOf: 'hotSpot').
	figureImage := cursorImage figure image.
	shapeImage := cursorImage shape image.
	anImage := Screen default completeContentsOfArea: self spatialGridArea.
	(0 to: cursorImage bounds height - 1)
		do:
			[:y | 
			theY := y + cursorPoint y - hotSpot y.
			(0 to: cursorImage bounds width - 1)
				do:
					[:x | 
					theX := x + cursorPoint x - hotSpot x.
					(anImage bounds containsPoint: theX @ theY)
						ifTrue:
							[coverageValue := shapeImage palette
								at: ((shapeImage atX: x y: y) bitAnd: shapeImage palette maxIndex).
							coverageValue = CoverageValue opaque
								ifTrue:
									[colorValue := figureImage palette
										at:
											((figureImage atX: x y: y) bitAnd: figureImage palette maxIndex).
									paletteIndex := anImage palette indexOfPaintNearest: colorValue.
									anImage atX: theX y: theY put: paletteIndex]]]].
	^anImage