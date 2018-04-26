save
saveInExcel
	
	self levelClassName = cormasModel class name
		ifTrue:
			[DataSaver_Excel
				saveGlobalData: self globalDataAsDictionary
				timeSteps: self getTimeSteps
				model: cormasModel]
		ifFalse:
			[DataSaver_Excel
				saveLocalData: self localDataAsDictionary
				timeSteps: self getTimeSteps
				model: cormasModel]