saving&removing pov symbols
saveBitmapPOV: aPOV intoClass: aClass symbol: aSymbol
	
	| selector |
	selector := 'BitmapPOV_' , aSymbol.
	aClass class
		compile:
			(selector ,
					'\"Returns an array containing the settings of a Situated entity bitmap pov symbol in the following order:\(position)\The bitmap itself corresponding to the symbol is in the selector '
				, aSymbol printString , 'BitmapImage"\^Array with: '
				, aPOV position printString) withCRs
		classified: 'pov symbols'
		notifying: nil.
	self saveBitmapImage: aPOV intoClass: aClass symbol: aSymbol