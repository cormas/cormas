model saving&loading EV
loadVectorialImage: aClassName of: entity line: line
	"M√©thode modifi√©e par NB le 10/1/2010"
	"Le format d'enregistrement dans le fichier EV des VectorialImage est √† present de la forme
ClassName VectorialElementaryPOV symbolName (color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices)"
	
	| aNewImage classImage newSymbol color linecolor linewidth sizeR position linevertices vertiCollec |
	"on r√©cup√®re le type de VectorialPov associ√© √† ce symbol. En pratique il n'y a que des VectorialElementaryPOV, donc on pourrait se passer des 2 lignes suivantes et dire que classImage est VectorialElementaryPOV. Je laisse comme √ßa au cas o√π par la suite on done la possibilit√© de d√©finir des Vectorialpov pov sur labase d'autres classes que VectorialElementaryPOV"
	classImage := aClassName asSymbol class.
	classImage ifNil: [^nil].	"on r√©cup√®re le symbol et autres √©l√©ments d√©finissant le pov"
	newSymbol := (line upTo: Character space) asSymbol.
	color := ColorValue
		red: (line upTo: Character space) asNumber
		green: (line upTo: Character space) asNumber
		blue: (line upTo: Character space) asNumber.
	linecolor := ColorValue
		red: (line upTo: Character space) asNumber
		green: (line upTo: Character space) asNumber
		blue: (line upTo: Character space) asNumber.
	linewidth := (line upTo: Character space) asNumber.
	sizeR := (line upTo: Character space) asNumber.
	position := (line upTo: Character space) asSymbol.
	line upTo: $(.
	linevertices := line upTo: $).
	vertiCollec := OrderedCollection new.
	(linevertices tokensBasedOn: Character space)
		do:
			[:text | 
			| ab |
			ab := text tokensBasedOn: $@.
			vertiCollec
				add:
					(Point
						x: ab first asNumber
						y: ab last asNumber)].	"on cr√©√© l''instance du pov puis on la charge dans le povDict de l''entite"
	aNewImage := classImage
		newColor: color
		lineColor: linecolor
		lineWidth: linewidth
		sizeRatio: sizeR
		position: position
		vertices: vertiCollec asArray.
	entity povDict at: newSymbol put: aNewImage