interface actions
requestForWindowClose
	"This is a callback method"
	
	self uiSession activeController
		ifNotNil:
			[:ctrl | 
			ctrl view = self mainWin
				ifTrue: [self closeDialog == false ifTrue: [^false]]].
	^super requestForWindowClose