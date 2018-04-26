saving&removing pov symbols
removeClassMethodForSymbol: aSymbol
	
	imageOS model copy isBitmapPOV
		ifTrue:
			[selectedClass class removeSelector: ('BitmapPOV_' , aSymbol) asSymbol.
			selectedClass class removeSelector: (aSymbol , 'BitmapImage') asSymbol]
		ifFalse:
			[selectedClass class removeSelector: ('VectorialPOV_' , aSymbol) asSymbol]