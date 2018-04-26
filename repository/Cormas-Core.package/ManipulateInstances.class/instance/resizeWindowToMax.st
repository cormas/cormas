initialize-release
resizeWindowToMax
	"set the window size to its max"
	
	| win orig ext |
	win := self builder window.
	orig := win globalOrigin.
	ext := 314 @ 257.	"ext := win bounds extent
		- (0 @ 257)."
	win displayBox: (orig extent: ext rounded).
	win
		display;
		refresh