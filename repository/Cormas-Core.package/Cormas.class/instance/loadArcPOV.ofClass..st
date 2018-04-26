model saving&loading POV
loadArcPOV: selector ofClass: entity
	"Le format d'enregistrement dans la m√©thode de classe est de la forme
 (color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices)"
	
	| aNewImage newSymbol linecolor linewidth startAnnotation stopAnnotation data |
	newSymbol := self symbolNameOfSelector: selector.
	data := entity perform: selector.
	linecolor := ColorValue
		red: (data at: 1) asNumber
		green: (data at: 2) asNumber
		blue: (data at: 3) asNumber.
	linewidth := (data at: 4) asNumber.
	startAnnotation := data at: 5.	"asBoolean"
	stopAnnotation := data at: 6.	"asBoolean"
	aNewImage := (ArcPOV new)
		lineColor: linecolor;
		lineWidth: linewidth;
		startAnnotation: startAnnotation;
		stopAnnotation: stopAnnotation.
	entity povDict at: newSymbol put: aNewImage