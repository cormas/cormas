accesing
saveJSONFile: myDictionary
	"OpenMole read  .json file. With this method you can write a JSONfile from a dictonary"

	| wd |
	wd := FileSystem disk workingDirectory.
	(wd / 'out.json') asFileReference
		writeStreamDo: [ :stream | 
			(NeoJSONWriter on: stream)
				prettyPrint: true;
				nextPut: myDictionary ]