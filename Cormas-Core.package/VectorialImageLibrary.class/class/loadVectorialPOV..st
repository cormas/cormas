resources
loadVectorialPOV: selector
	"Le format d'enregistrement dans la m√©thode de classe est √† de la forme suivante
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices)"
	
	| aNewImage color linecolor linewidth sizeR position vertiCollec data verticesDecalle a2 a1 |
	"on r√©cup√®re le symbol et autres √©l√©ments d√©finissant le pov"
	data := self perform: selector.
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
	a2 := nil.
	verticesDecalle
		do:
			[:a1b2 | 
			a2
				ifNotNil:
					[a1 := a1b2 at: 1.
					a1 isSequenceable
						ifTrue:
							[a1 := Fraction
								numerator: a1 first
								denominator: a1 last]
						ifFalse: [a1b2 at: 1].
					vertiCollec add: (Point x: a2 y: a1)].
			a2 := a1b2 last.
			a2 isSequenceable
				ifTrue:
					[a2 := Fraction
						numerator: a2 first
						denominator: a2 last]].	"verticesDecalle do:[: a1b2 | 
vertiCollec add: (Point x: ((a1b2  first tokensBasedOn: #/) first first)  y: ((a1b2  first tokensBasedOn: #/) last first)).]."	"on cr√©√© l''instance du pov puis on la charge dans le povDict de l''entite"
	aNewImage := VectorialElementaryPOV
		newColor: color
		lineColor: linecolor
		lineWidth: linewidth
		sizeRatio: sizeR
		position: position
		vertices: vertiCollec asArray.
	data size >= 11 ifTrue: [aNewImage isDistortable: (data at: 11)].
	^aNewImage