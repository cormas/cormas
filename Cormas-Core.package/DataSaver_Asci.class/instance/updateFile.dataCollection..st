+ save
updateFile: aStringOrFilename dataCollection: aCollec
	"Updates a file in the current model 'data' directory and writes in it a tupple (separated by self class separator), at the end of the previous data.
	ex: self updateFile: 'aFile.txt' dataCollection: #(0 11 67) "
	
	| stream aFilename |
	aFilename := self stringToFilename: aStringOrFilename.
	stream := aFilename appendStream.
	aCollec
		do:
			[:element | 
			stream nextPutAll: element asString.
			stream nextPutAll: DataSaver_Asci separatorAsString].
	stream nextPutAll: '\' withCRs.
	stream close