+ utilities - files
readCsvFile: file
	"Returns a collection of collections, each one containing the values of the csv file (separator is ';').
The file name is just a string containing the name of the file (with or without extension) that is stored in the *** /data *** directory of a model.
Ex:    self readCsvFile: 'palaya1973'  or  self readCsvFile: 'palaya1973.cvs'     "
	
	^Cormas
		readCsvFile: file
		myModel: self class name asString