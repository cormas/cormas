actions
shouldLeaveOpened: aController
	"indicate if aController controls a window that should be leave in the installation image
	We leave the actual simulationWin opened"
	
	Cormas current simulationWin
		ifNotNil: [:win | win controller == aController ifTrue: [^true]].
	^super shouldLeaveOpened: aController