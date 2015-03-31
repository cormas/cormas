saving&removing pov symbols
saveSpatialEntityPOVcolor: color intoClass: aClass symbol: aSymbol
	
	| selector |
	selector := 'SpatialEntityPOV_' , aSymbol.
	aClass class
		compile:
			(selector ,
					'\"Returns an array containing the settings of a Spatial entity pov symbol in the following order:\(color red) (color green) (color blue)"\^Array with: '
				, color red printString , ' with: ' , color green printString ,
					' with: ' , color blue printString) withCRs
		classified: 'pov symbols'
		notifying: nil