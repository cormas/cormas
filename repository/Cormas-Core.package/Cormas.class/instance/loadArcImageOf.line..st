model saving&loading EV
loadArcImageOf: aClass line: line
	"Méthode modifiée par PB le 10/5/2010"
	"Le format d'enregistrement dans le fichier EV des VectorialImage est à present de la forme
ClassName VectorialElementaryPOV symbolName (color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices)"
	
	| aNewImage classImage newSymbol linecolor linewidth startAnnotation stopAnnotation |
	classImage := aClass name asSymbol symbol.
	classImage ifNil: [^nil].
	newSymbol := (line upTo: Character space) asSymbol.
	linecolor := ColorValue
		red: (line upTo: Character space) asNumber
		green: (line upTo: Character space) asNumber
		blue: (line upTo: Character space) asNumber.
	linewidth := (line upTo: Character space) asNumber.
	startAnnotation := (line upTo: Character space) asBoolean.
	stopAnnotation := (line upTo: Character space) asBoolean.
	aNewImage := (ArcPOV new)
		lineColor: linecolor;
		lineWidth: linewidth;
		startAnnotation: startAnnotation;
		stopAnnotation: stopAnnotation.
	aClass povDict at: newSymbol put: aNewImage