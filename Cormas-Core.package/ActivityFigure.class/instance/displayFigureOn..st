displaying
displayFigureOn: aGraphicsContext
	
	| text |
	super displayFigureOn: aGraphicsContext.
	text := self model selectedActivity value asComposedText.	"aGraphicsContext setForeColorTo: ColorValue darkRed.

	aGraphicsContext
		paint: self lineColor;
		lineWidth: self lineWidth."
	text
		displayOn: aGraphicsContext
		at: (self extent - text extent) // 2 + self origin