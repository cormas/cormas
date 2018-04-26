menu - actions
loadGrid
	
	| aName |
	aName := Dialog
		choose: (UserMessage defaultString: '' key: #load) asString
		fromList:
			((Cormas mapsPath: spaceModel cormasModelClass name) asFilename
				directoryContents select: [:fn | '*.env' match: fn])
		values:
			((Cormas mapsPath: spaceModel cormasModelClass name) asFilename
				directoryContents select: [:fn | '*.env' match: fn])
		lines: 8
		cancel: [^nil].
	aName isEmpty
		ifTrue: [^nil]
		ifFalse:
			[aName := (Cormas mapsPath: spaceModel cormasModelClass name) construct:
					aName].
	self spaceModel loadEnvironmentFromFile: aName.
	self initMenuTopologie.
	self updateWindowName