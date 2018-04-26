runtime mode accessing
runtimeMode: aSymbol
	"set the actual runtime mode for this image (usefull for adapting menus).
	this method is reserved for the CormasPackager"

	(self availableRuntimeModes includes: aSymbol)
		ifFalse: [ ^ self error: 'Unsupported RuntimeMode' , aSymbol printString ].
	runtimeMode := aSymbol