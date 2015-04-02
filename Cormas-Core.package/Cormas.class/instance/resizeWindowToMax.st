interface actions
resizeWindowToMax
	"set the window size to its max"
	
	| win orig ext hg |
	win := self mainBuilder window.
	orig := win globalOrigin.
	hg := (self mainBuilder componentAt: #subcanvasSim) bounds height.
	ext := win bounds extent + (0 @ hg).
	win displayBox: (orig extent: ext)