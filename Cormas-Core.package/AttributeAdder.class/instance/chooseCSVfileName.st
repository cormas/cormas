export
chooseCSVfileName
	"request for a CSV filename"
	
	| file |
	file := Dialog
		requestNewFileName: 'Name a file'
		default:
			(self cormasModel
				stringToFilename: targetClass name asString , 'Parameters.csv').
	file = '' ifTrue: [^nil].
	^file asFilename