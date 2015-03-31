variable accessing
valueAt: aSymbol
	
	^data
		at: aSymbol
		ifAbsent: [nil]