+ utilities - files
getDataFromFile: aStringOrFilename separator: aChar
	"Returns a collection of collections containing the elements of one line of the file. The elements are separated by aChar. 
	Creates a 'read' connexion to a file (aStringOrFilename) located into the current model 'data' 
	directory and copy all data from this file into a collection. 
	ex: self getDataFromFile: 'aFile.txt' separator: ';' (or Character tab or $, ...)
	Rq: self getDataFromFile: 'cormas.env' separator: Character cr is equivalent to self getDataLinesFromFile: 'cormas.env'"
	
	| stream aFilename result line |
	aFilename := self stringToFilename: aStringOrFilename.
	stream := aFilename readStream.	"On devine le format des lignes"
	stream lineEndAuto.
	result := OrderedCollection new.
	[stream atEnd]
		whileFalse:
			[line := Cormas splitLine: stream sep: aChar.
			result add: line].
	stream close.
	^result