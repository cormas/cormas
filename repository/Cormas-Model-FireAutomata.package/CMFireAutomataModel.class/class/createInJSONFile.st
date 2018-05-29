as yet unclassified
createInJSONFile
	| stream |
	stream := FileStream forceNewFileNamed: 'input.json'.
	stream nextPutAll: self inJSON.
	stream close