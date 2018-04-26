initialize-release
resizeWindowToMin
	"set the window size to its min"
	
	| win orig ext |
	win := self builder window.
	orig := win globalOrigin.
	ext := 314 @ 208.
	win displayBox: (orig extent: ext rounded).
	win
		display;
		refresh