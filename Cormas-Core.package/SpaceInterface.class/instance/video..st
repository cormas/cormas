grid recorder
video: nilOrFilename
	
	nilOrFilename isNil
		ifTrue:
			[video := nil.
			((self menuHolder value atNameKey: #tools) submenu atNameKey: #video)
				beOff]
		ifFalse:
			[video := nilOrFilename asFilename.
			((self menuHolder value atNameKey: #tools) submenu atNameKey: #video)
				beOn]