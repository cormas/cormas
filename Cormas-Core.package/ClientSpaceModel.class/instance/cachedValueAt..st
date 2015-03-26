accessing
cachedValueAt: aSymbol
	
	^self cachedValues
		at: aSymbol
		ifAbsentPut: [remoteSpaceModel perform: aSymbol]