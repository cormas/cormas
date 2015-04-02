interface closing
noticeOfWindowClose: aWindow
	"one of my window was closed"
	
	aWindow == self simulationWin ifTrue: [self simulationWin: nil].
	aWindow == self defineEntityWin ifTrue: [self defineEntityWin: nil].
	^super noticeOfWindowClose: aWindow