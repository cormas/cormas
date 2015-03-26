actions
shouldLeaveOpened: aController
	"indicate if aController controls a window that should be leave in the installation image"
	
	self mainWindow
		ifNotNil: [:win | win controller == aController ifTrue: [^true]].
	aController == Cormas current mainWin controller ifTrue: [^true].
	^false