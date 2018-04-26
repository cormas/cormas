accessing
dataSavedByLine: aBoolean
	
	dataSavedByLine := aBoolean.
	self sheets do: [:aSheet | aSheet dataSavedByLine: aBoolean]	"aBoolean 
		ifTrue: 
			[Dialog 
				warn: 'Number of data exceeds Excel capacities (max number of column is 256). \The data will be save in lines' 
						withCRs]"