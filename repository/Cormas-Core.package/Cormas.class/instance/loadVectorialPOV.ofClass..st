model saving&loading POV
loadVectorialPOV: selector ofClass: entity
	"Le format d'enregistrement dans la m√©thode de classe est √† de la forme suivante
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices)"
	
	| aNewImage newSymbol color linecolor linewidth sizeR position vertiCollec data verticesDecalle a2 |
	"on r√©cup√®re le symbol et autres √©l√©ments d√©finissant le pov"
	newSymbol := self symbolNameOfSelector: selector.
	data := entity perform: selector.
	color := ColorValue
		red: (data at: 1) asNumber
		green: (data at: 2) asNumber
		blue: (data at: 3) asNumber.
	linecolor := ColorValue
		red: (data at: 4) asNumber
		green: (data at: 5) asNumber
		blue: (data at: 6) asNumber.
	linewidth := (data at: 7) asNumber.
	sizeR := (data at: 8) asNumber.
	position := (data at: 9) asSymbol.
	verticesDecalle := (data at: 10) tokensBasedOn: #@.
	vertiCollec := OrderedCollection new.
	verticesDecalle
		do:
			[:a1b2 | 
			a2
				ifNotNil:
					[vertiCollec
						add:
							(Point
								x: a2
								y: (a1b2 at: 1))].
			a2 := a1b2 last].	"on cr√©√© l''instance du pov puis on la charge dans le povDict de l''entite"
	aNewImage := VectorialElementaryPOV
		newColor: color
		lineColor: linecolor
		lineWidth: linewidth
		sizeRatio: sizeR
		position: position
		vertices: vertiCollec asArray.
	data size >= 11 ifTrue: [aNewImage isDistortable: (data at: 11)].
	entity povDict at: newSymbol put: aNewImage