click
resetColorOf: figure
	"method called from Tool (initializeChangeAttributeTool), reset the color of the figure clicked by the user"
	
	figure model entity class = self manipulatedEntity ifFalse: [^nil].
	figure class ~= BitmapFigure
		ifTrue:
			[figure model entity isSpatialEntity
				ifTrue: [figure fillColor: (figure model getColorForPov: figure pov)]
				ifFalse:
					[figure fillColor: (figure model entity povAt: figure pov) color]]