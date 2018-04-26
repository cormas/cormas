menu - actions
photo
	
	| defaultFileName fileName |
	defaultFileName := (Cormas videoPath: spaceModel cormasModelClass name)
		construct: spaceModel cormasModelClass name , '.jpg'.
	fileName := Dialog
		requestNewFileName: (UserMessage defaultString: '' key: #export) asString
		default: defaultFileName.
	fileName = '' ifFalse: [self snapGridInJpgFile: fileName asFilename]