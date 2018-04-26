utilities - files
getDataLinesFromFile: aStringOrFilename
	"Returns a collection of data. Returns a collection of elements from the 'aStringOrFilename 'file. An element = a line of the file.
	Creates a 'read' connexion to a file (aStringOrFilename) located into the current model 'data' directory and copy all data from this file into a collection.
	ex: self getDataFromFile: 'aFile.txt' 
	Rq: see also getDataFromFile: aStringOrFilename separator: aChar"
	
	^self
		getDataFromFile: aStringOrFilename
		separator: Character cr