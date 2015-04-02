+ utilities - files
readCsv: filename
	"Returns a collection of collections, each one containing the values of the each line (separator = $;).
The file name must be complete.
fileName = <String or Filename>
Ex: Cormas readCsv: 'D:\vw7.6\cormas\Models\Ecec\data\test.csv' "
	
	^self
		readMatrix: filename
		sep: DataSaver_Asci separator