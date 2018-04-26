init
prepareLastValueFiles
	"Create the Excel conexion and file (one sheet per probe) and save the titles' columns"
	
	| excelFile title |
	filename := directory construct: self getLastValueFilename asFilename.
	excelFile := self initExcelFile: self getLastValueFilename.
	excelFile createSheetsFromProbes: self probes keys asSortedCollection.
	excelFile dataSavedByLine: true.
	title := List new.
	title add: 'Value at ' , self timeSteps last asString.
	self probes keys
		do:
			[:key | 
			title addFirst: 'Probe: ' , key asString.
			self
				saveCollectionWithLabel: title
				onSheet: key asString
				onFile: self getLastValueFilename]	"excelFile isVisible: true"