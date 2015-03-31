grid recorder
video
	
	| defaultFileName fileName |
	defaultFileName := (Cormas videoPath: self cormasModelClass name)
		construct: self cormasModelClass name , '.mov'.
	fileName := Dialog
		requestNewFileName:
			(UserMessage defaultString: 'movie file name' key: #export) asString
		default: defaultFileName.
	fileName = ''
		ifTrue: [self video: nil]
		ifFalse: [self video: fileName asFilename]