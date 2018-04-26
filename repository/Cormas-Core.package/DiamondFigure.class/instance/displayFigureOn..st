displaying
displayFigureOn: aGraphicsContext
	
	| text |
	info := nil.
	super displayFigureOn: aGraphicsContext.
	text := self model selectedActivity value asComposedText.
	aGraphicsContext paint: ColorValue black.
	text
		displayOn: aGraphicsContext
		at: (self extent - text extent) // 2 + self origin	"pour afficher le bounds"	"self bounds displayStrokedOn: aGraphicsContext"