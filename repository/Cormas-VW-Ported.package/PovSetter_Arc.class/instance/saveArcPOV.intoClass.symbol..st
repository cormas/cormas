saving&removing pov symbols
saveArcPOV: aPOV intoClass: aClass symbol: aSymbol
	
	| selector |
	selector := 'ArcPOV_' , aSymbol.
	aClass class
		compile:
			(selector ,
					'\"Returns an array containing the settings of a Arc entity pov symbol in the following order:\(lineColor red) (lineColor green) (lineColor blue) lineWidth startAnnotation stopAnnotation startPosition stopPosition"\^#('
				, aPOV lineColor red printString , ' '
				, aPOV lineColor green printString , ' '
				, aPOV lineColor blue printString , ' ' , aPOV lineWidth printString ,
					' ' , aPOV startAnnotation printString , ' '
				, aPOV stopAnnotation printString , aPOV startPosition printString ,
					' ' , aPOV stopPosition printString , ' ' , ')') withCRs
		classified: 'pov symbols'
		notifying: nil