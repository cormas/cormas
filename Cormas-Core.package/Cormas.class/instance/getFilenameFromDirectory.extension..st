model saving&loading
getFilenameFromDirectory: directoryName extension: ext
	"Return a Filename. Look for a file that corresponds to the selected version (selected by user)
	directoryName = <String> ex : 'AutomataDim1'
	ext = <String>  ex: 'st' without dot !"
	
	| defaultFileName aFileName |
	defaultFileName := (self class modelPath: directoryName asSymbol)
		construct: directoryName , '.' , ext.	"on repete car des fois y comprend pas bien !"
	defaultFileName := (self class modelPath: directoryName asSymbol)
		construct: directoryName , '.' , ext.
	aFileName := Dialog
		requestFileName:
			(UserMessage defaultString: 'choose model' key: #import) asString
		default: defaultFileName.
	aFileName = '' ifTrue: [^nil].
	aFileName asFilename exists
		ifFalse:
			[self
				warn:
					(UserMessage
						defaultString: 'no ' , ext , ' file'
						key: #noStModelFilename).
			^nil].
	^aFileName