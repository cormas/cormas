export
exportAttributsValues
	"Save the content of the 'Parameters windows'
exports the class name, the attributes names and the values into a CSV file"
	"sauvegarde"
	
	| file stream |
	file := self chooseCSVfileName.
	file ifNil: [^nil].
	stream := file writeStream.
	stream nextPutAll: 'Class'.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: 'Attribute'.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: 'Value'.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: '\' withCRs.
	self classAttribValue_List list
		do:
			[:defAttrib | 
			stream nextPutAll: defAttrib targetClass name.
			stream nextPutAll: DataSaver_Asci separatorAsString.
			stream nextPutAll: defAttrib targetAttribute asString.
			stream nextPutAll: DataSaver_Asci separatorAsString.
			stream nextPutAll: defAttrib currentValue printString.
			stream nextPutAll: DataSaver_Asci separatorAsString.
			stream nextPutAll: '\' withCRs].
	stream close