+ save
initFile: aStringOrFilename dataCollection: aCollec
	"Create a file in the current model 'data' directory and writes in it a tupple separated by DataSaver separator.
	ex: self initFile: 'aFile.txt' dataCollection: #('time' 'value1' 'value2')"
	
	| aFilename |
	aFilename := self stringToFilename: aStringOrFilename.
	aFilename exists ifTrue: [aFilename delete].
	self updateFile: aFilename dataCollection: aCollec