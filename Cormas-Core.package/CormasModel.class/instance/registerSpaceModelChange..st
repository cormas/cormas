private - notification
registerSpaceModelChange: aSymbol
	"report a change from the spaceModel. These changes can be delayed in order to make one remote call with many changes"
	
	^self registerSpaceModelChange: aSymbol with: nil