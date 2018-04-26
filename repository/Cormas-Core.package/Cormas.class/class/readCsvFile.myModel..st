+ utilities - files
readCsvFile: file myModel: modelName
	"Returns a collection of collections, each one containing the values of the csv file (separator is ';').
The file name is just a string containing the name of the file (with or without extension) that is stored in the /data directory of a model.
Ex:    Cormas readCsvFile: 'palaya1973' myModel: 'Thunupa'    		or 
	Cormas readCsvFile: 'palaya1973.cvs' myModel: 'Thunupa'           "
	
	| filename |
	filename := (Cormas dataPath: modelName) construct: file.
	filename := Cormas removeExtensionOf: filename.
	^Cormas
		readMatrix: filename asString , '.csv'
		sep: $;