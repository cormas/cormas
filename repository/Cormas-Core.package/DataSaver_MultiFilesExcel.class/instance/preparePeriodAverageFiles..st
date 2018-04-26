init
preparePeriodAverageFiles: periodList
	"Create the Excel conexion and file (one sheet per probe) and save time steps (first column)"
	
	| excelFile title |
	filename := directory construct: self getPeriodAverageFilename asFilename.
	excelFile := self initExcelFile: self getPeriodAverageFilename.
	excelFile createSheetsFromProbes: self probes keys asSortedCollection.
	excelFile dataSavedByLine: true.
	title := List new.
	title
		add:
			('Average on period [' , periodList first asString , ' '
				, periodList last asString , ']') asString.
	self probes keys
		do:
			[:key | 
			title addFirst: 'Probe: ' , key asString.
			self
				saveCollectionWithLabel: title
				onSheet: key asString
				onFile: self getPeriodAverageFilename]	"excelFile isVisible: true"