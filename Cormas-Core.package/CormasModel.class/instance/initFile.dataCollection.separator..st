utilities - files
initFile: aStringOrFilename dataCollection: aCollec separator: aChar
	"Create a file in the current model 'data' directory and writes in it a tupple separated by aChar.
	ex: self initFile: 'aFile.txt' dataCollection: #('time' 'value1' 'value2') separator: ';'."
	
	| aFilename |
	aFilename := self stringToFilename: aStringOrFilename.
	aFilename exists ifTrue: [aFilename delete].
	self updateFile: aFilename dataCollection: aCollec separator: aChar