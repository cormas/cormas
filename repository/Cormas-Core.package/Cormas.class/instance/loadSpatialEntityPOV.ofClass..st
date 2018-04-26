model saving&loading POV
loadSpatialEntityPOV: selector ofClass: entity
	
	| newSymbol data colR colG colB |
	newSymbol := self symbolNameOfSelector: selector.
	data := entity perform: selector.
	colR := (data at: 1) asNumber.
	colG := (data at: 2) asNumber.
	colB := (data at: 3) asNumber.
	entity colorsDict
		at: newSymbol
		put: (ColorValue red: colR green: colG blue: colB)