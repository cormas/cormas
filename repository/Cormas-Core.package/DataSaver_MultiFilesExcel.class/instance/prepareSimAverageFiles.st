init
prepareSimAverageFiles
	"Create the Excel conexion and file (one sheet per probe) and save the titles' columns"
	
	| excelFile title |
	filename := directory construct: self getSimAverageFilename asFilename.
	excelFile := self initExcelFile: self getSimAverageFilename.
	excelFile createSheetsFromProbes: self probes keys asSortedCollection.
	excelFile dataSavedByLine: true.
	title := List new.
	title add: 'Average on simulation'.
	self probes keys
		do:
			[:key | 
			title addFirst: 'Probe: ' , key asString.
			self
				saveCollectionWithLabel: title
				onSheet: key asString
				onFile: self getSimAverageFilename]	"excelFile isVisible: true"