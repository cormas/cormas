as yet unclassified
createInJSONFile
	| stream |
	stream := FileStream forceNewFileNamed: 'in.json'.
	stream nextPutAll: self inJSON.
	stream close