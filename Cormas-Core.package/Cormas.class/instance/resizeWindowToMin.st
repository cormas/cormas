interface actions
resizeWindowToMin
	"set the window size to its min"
	
	| win orig ext subC |
	subC := self mainBuilder componentAt: #subcanvasSim.
	subC bounds extent.
	win := self mainBuilder window.
	orig := win globalOrigin.
	ext := win bounds extent
		- (0 @ (self mainBuilder componentAt: #subcanvasSim) bounds height).
	win displayBox: (orig extent: ext rounded).	"m'emmerde ce bandeau qui devient blanc l√† haut..."
	self mainWin label:
			'Cormas [                                                                                                                                                                                                                       ]'.
	self mainWin label: 'Cormas [' , self cormasModelClass name , ']'.	"win moveTo: 44@44. win moveTo: orig."
	win
		display;
		refresh