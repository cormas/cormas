init
preparePeriodAverageFiles: periodList
	"Create the Excel conexion and file (one sheet per probe) and save time steps (first column)"
	
	| sheet |
	filename := directory construct: self getPeriodAverageFilename asFilename.
	self globalDataByLineOrColumn.
	self initExcelFile.
	sheet := 1.
	self probes keys
		do:
			[:key | 
			self
				saveTimeStepsLabeled:
					('Probe: ' , key asString , 'Average on period ['
						, periodList first asString , ' ' , periodList last asString , ']')
						asString
				OnSheet: sheet.
			sheet := sheet + 1]	"self excel closeApplication"