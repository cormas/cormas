saving&removing pov symbols
savePOVsymbol: aSymbol
	
	| aPOV |
	aPOV := imageOS model copy.
	aPOV isBitmapPOV
		ifTrue:
			[self
				saveBitmapPOV: imageOS model copy
				intoClass: selectedClass
				symbol: aSymbol.
			selectedClass class removeSelector: ('VectorialPOV_' , aSymbol) asSymbol]
		ifFalse:
			[self
				saveVectorialPOV: imageOS model copy
				intoClass: selectedClass
				symbol: aSymbol.
			selectedClass class removeSelector: ('BitmapPOV_' , aSymbol) asSymbol.
			selectedClass class removeSelector: (aSymbol , 'BitmapImage') asSymbol]