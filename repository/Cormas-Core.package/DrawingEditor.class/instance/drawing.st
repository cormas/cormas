accessing
drawing
	
	drawing isNil
		ifTrue:
			[drawing := self buildDrawing.
			self initializeDrawingController].
	^drawing