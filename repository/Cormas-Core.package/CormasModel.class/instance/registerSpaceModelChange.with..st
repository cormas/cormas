private - notification
registerSpaceModelChange: aSymbol with: aParameter
	"report a change from the spaceModel. These changes can be delayed in order to make one remote call with many changes"
	
	self
		registerChange: (SpaceModelChange newChange: aSymbol with: aParameter)