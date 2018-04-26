+ utilities - files
saveCollec: aCollec inCsvFile: aString
	"Save in /data directory a Collection of literals (characters, numbers, strings...) as csv file (easily openable with Excel.
	aString = the name of the file (with or without .csv extention)
	aString = <String> or <Filename> (with or without .csv extention)"
	
	Cormas
		saveCollec: aCollec
		inCsvFile: (self stringToFilename: aString)