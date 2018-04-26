deprecated
loadBitmapImageOf: entity line: line
	
	| aNewImage newSymbol position |
	newSymbol := (line upTo: Character space) asSymbol.
	(entity class findSelector: (newSymbol asString , 'BitmapImage') asSymbol)
		ifNotNil:
			[position := (line upTo: Character space) asSymbol.
			aNewImage := BitmapPOV
				newFrom:
					(entity perform: (newSymbol asString , 'BitmapImage') asSymbol).
			aNewImage position: position.
			entity povDict at: newSymbol put: aNewImage]