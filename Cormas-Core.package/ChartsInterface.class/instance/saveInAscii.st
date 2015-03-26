save
saveInAscii
	
	self levelClassName = cormasModel class name
		ifFalse:
			[DataSaver_Asci
				saveLocalData: self localDataAsDictionary
				timeSteps: self getTimeSteps
				model: cormasModel]
		ifTrue:
			[DataSaver_Asci
				saveGlobalData: self globalDataAsDictionary
				timeSteps: self getTimeSteps
				model: cormasModel]