+ pov
displayPov: aSymbol of: aClass
	"Purpose: set the POV of aClass to be displayed on the opened spatial grids.
Example : self displayPov: #landUse of: Cell"
	
	(aClass availablePov includes: aSymbol)
		ifFalse:
			[self cormas
				warn: 'The class <1s> does not have a pov called <2s>'
				with: aClass name
				with: aSymbol].
	self spaceModel displayPov: aSymbol of: aClass