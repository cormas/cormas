save
saveSettingsOnFile: aCSVfile
	"Save the content of the 'Sensitivity Analysis windows' on aCSVfile.
exports the analysis information (except the attributes value) into a CSV file"
	
	| stream |
	stream := aCSVfile writeStream.
	stream nextPutAll: 'Analysis type'.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: self class name asString.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: '\' withCRs.
	stream nextPutAll: 'Repetitions'.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: self nbOfRepeat value printString.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: '\' withCRs.
	stream nextPutAll: 'fixRandomSeed'.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	self fixRandomSeed value
		ifTrue: [stream nextPutAll: self randomSeed value printString]
		ifFalse: [stream nextPutAll: 'no'].
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: '\' withCRs.
	stream nextPutAll: 'releaseRandomSeed'.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: self releaseRandomSeed value printString.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: '\' withCRs.
	stream nextPutAll: 'initMethod'.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: self initMethod value asString.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: '\' withCRs.
	stream nextPutAll: 'stepMethod'.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: self stepMethod value asString.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: '\' withCRs.
	stream nextPutAll: 'finalStep'.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: self finalStep value asString.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: '\' withCRs.
	stream close