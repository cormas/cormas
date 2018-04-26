+ pov
displayInfo: aSymbol of: aClass
	"Purpose: set the INFO text of aClass to be displayed on the opened spatial grids.
Example : self displayInfo: #info_ID of: Cell"
	
	(aClass availableInfo includes: aSymbol)
		ifFalse:
			[self cormas
				warn: 'The class <1s> does not have a info called <2s>'
				with: aClass name
				with: aSymbol].
	self spaceModel displayInfo: aSymbol of: aClass