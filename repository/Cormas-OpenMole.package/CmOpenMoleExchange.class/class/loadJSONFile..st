accesing
loadJSONFile: theJSONFile
	"OpenMole send a .json file. With this method you can read it. You pass in argument the name of JSON file"

	| wd myData |
	wd := FileSystem disk workingDirectory.
	myData := NeoJSONReader
		fromString: (wd / theJSONFile readStreamDo: [ :stream | stream contents ]).
	^ myData