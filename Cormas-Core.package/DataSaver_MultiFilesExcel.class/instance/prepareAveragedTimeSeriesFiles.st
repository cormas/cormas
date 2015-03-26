init
prepareAveragedTimeSeriesFiles
	"Create the Excel conexion and file (one sheet per probe) and save time steps (first column)"
	
	| excelFile |
	filename := directory
		construct: self getAveragedTimeSeriesFilename asFilename.
	self globalDataByLineOrColumn.
	excelFile := self initExcelFile: self getAveragedTimeSeriesFilename.
	excelFile createSheetsFromProbes: self probes keys asSortedCollection.
	self probes keys
		do:
			[:key | 
			self
				saveTimeStepsLabeled: ('Time \ ' , key asString) asString
				OnSheet: key asString
				onFile: self getAveragedTimeSeriesFilename]