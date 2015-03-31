click
changeColorOf: figure
	"method called from Tool (initializeChangeAttributeTool), change color of figure clicked by the user"
	
	figure model entity class = self manipulatedEntity ifFalse: [^nil].
	self manipulationActionArguments isEmpty ifTrue: [^nil].
	self manipulationActionArguments first class = ColorValue ifFalse: [^nil].
	figure class ~= BitmapFigure
		ifTrue: [figure fillColor: self manipulationActionArguments first]