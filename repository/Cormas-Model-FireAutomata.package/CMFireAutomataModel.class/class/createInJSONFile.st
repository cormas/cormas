examples
createInJSONFile
	"Create a JSON file for example 8"

	| stream |
	stream := FileStream newFileNamed: 'input.json'.
	stream nextPutAll: self inJSON.
	stream close