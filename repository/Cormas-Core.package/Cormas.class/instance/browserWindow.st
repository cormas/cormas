model entities
browserWindow
	"return the associated window's browser if it is still valid"
	
	| win |
	browser ifNil: [^nil].
	win := browser mainWindow.
	win ifNil: [^win].
	win key ifNil: [^nil].
	^win