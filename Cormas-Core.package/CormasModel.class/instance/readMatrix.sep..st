+ utilities - files
readMatrix: fileName sep: aSepChar
	"Returns a collection of collections, each one containing the values between the separator of the file.
The file name is just a string containing the name of the file (with extension) that is stored in the /data directory of the model.
fileName = <String> or <Filename>
Ex: self readMatrix: 'test.csv' sep: ';'   "
	
	| filename |
	filename := self stringToFilename: fileName.
	^Cormas readMatrix: filename sep: aSepChar