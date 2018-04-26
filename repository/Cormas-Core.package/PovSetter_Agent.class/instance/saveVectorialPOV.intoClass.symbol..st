saving&removing pov symbols
saveVectorialPOV: aPOV intoClass: aClass symbol: aSymbol
	
	| selector |
	selector := 'VectorialPOV_' , aSymbol.
	aClass class
		compile:
			(selector ,
					'\"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:\(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable." \^#('
				, aPOV color red printString , ' ' , aPOV color green printString , ' '
				, aPOV color blue printString , ' ' , aPOV lineColor red printString ,
					' ' , aPOV lineColor green printString , ' '
				, aPOV lineColor blue printString , ' ' , aPOV lineWidth printString ,
					' ' , aPOV sizeRatio printString , ' ' , aPOV position printString ,
					' ' , aPOV outline vertices printString , ' '
				, aPOV isDistortable printString , ')') withCRs
		classified: 'pov symbols'
		notifying: nil