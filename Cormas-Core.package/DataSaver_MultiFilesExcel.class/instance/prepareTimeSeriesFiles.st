init
prepareTimeSeriesFiles
	"Create the Excel conexion and file (one sheet per probe) and save time steps (first column)"
	
	| excelFile |
	filename := directory construct: self getTimeSerieFilename asFilename.
	self globalDataByLineOrColumn.
	excelFile := self initExcelFile: self getTimeSerieFilename.
	excelFile createSheetsFromProbes: self probes keys asSortedCollection.
	self probes keys
		do:
			[:key | 
			"aCollection := OrderedCollection with: ('Time \ ' , key asString) asString.
1 to: self cormasModel sensitivitySetter totalSimNumberWithRepeat do: [:i| aCollection add: 'sim_', i printString].
			self saveCollectionWithLabel: aCollection onSheet: key asString onFile: self getTimeSerieFilename."
			self
				saveTimeStepsLabeled: ('Time \ ' , key asString) asString
				OnSheet: key asString
				onFile: self getTimeSerieFilename]	"(self excelDictionary at: (self getTimeSerieFilename) asSymbol) isVisible: true.
	(self excelDictionary at: (self getTimeSerieFilename) asSymbol) closeApplication"