menu-display options
defaultTool
	
	^defaultTool isNil
		ifTrue: [defaultTool := #toolInspect asValue]
		ifFalse: [defaultTool]