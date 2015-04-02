model saving&loading POV
loadBitmapPOV: selector ofClass: entity
	
	| aNewImage newSymbol position data |
	newSymbol := self symbolNameOfSelector: selector.
	data := entity perform: selector.
	(entity class findSelector: (newSymbol asString , 'BitmapImage') asSymbol)
		ifNotNil:
			[position := (data at: 1) asSymbol.
			aNewImage := BitmapPOV
				newFrom:
					(entity perform: (newSymbol asString , 'BitmapImage') asSymbol).
			aNewImage position: position.
			entity povDict at: newSymbol put: aNewImage]