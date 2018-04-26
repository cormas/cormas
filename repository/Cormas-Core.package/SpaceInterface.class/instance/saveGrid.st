menu - actions
saveGrid
	
	| workingWindow file |
	workingWindow := MenuSpaceInterfaces new
		initSaveEnv: self cormasModelClass.
	(workingWindow openDialogInterface: #windowSaveEnv) ifFalse: [^nil].
	file := Dialog
		requestNewFileName:
			(UserMessage defaultString: 'Save as' key: #saveas) asString
		default:
			((Cormas mapsPath: self cormasModelClass name) construct: 'filename.env').
	file isEmpty
		ifFalse:
			[self spaceModel
				saveAttributes: workingWindow attributesToBeSaved selections
				inFile: file asFilename]