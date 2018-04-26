model saving&loading EV
loadOldImageOfTEMP: entity line: line
	
	| defaultPovName linewidth nbs sizeRatio rm ev colR colG colB color aNewImage |
	defaultPovName := entity name.
	linewidth := line upTo: Character space.
	linewidth = 'figurine' ifTrue: [^nil].
	linewidth := linewidth asNumber.
	nbs := (line upTo: Character space) asNumber.
	sizeRatio := (line upTo: Character space) asNumber.	"?"
	rm := (line upTo: Character space) asNumber.
	ev := (line upTo: Character space) asBoolean.
	colR := (line upTo: Character space) asNumber.
	colG := (line upTo: Character space) asNumber.
	colB := (line upTo: Character space) asNumber.
	color := ColorValue
		red: colR
		green: colG asNumber
		blue: colB.
	aNewImage := VectorialElementaryPOV new.
	aNewImage lineWidth: linewidth nbSegments: nbs sizeRatio: sizeRatio ev: ev
		colR: colR colG: colG colB: colB.
	self halt.
	^aNewImage	"linecolor := ColorValue red: ((line upTo: Character space) asNumber) green: ((line upTo: Character space) asNumber) blue: ((line upTo: Character space) asNumber). 
	linewidth := (line upTo: Character space) asNumber.
	sizeR := (line upTo: Character space) asNumber.
	position  := (line upTo: Character space) asSymbol.
	line upTo: $(. 
	linevertices := (line upTo: $)). 
	vertiCollec := OrderedCollection new.
	((linevertices tokensBasedOn: (Character space)) do:[:text| |ab| ab := text tokensBasedOn: $@. vertiCollec add: (Point x: ab first asNumber y: ab last asNumber)]).
	aNewImage := classImage newColor: color lineColor: linecolor lineWidth: linewidth sizeRatio: sizeR position: position vertices: vertiCollec asArray.
	entity povDict at: newSymbol put: aNewImage"