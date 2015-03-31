private - display
displayInfo: aSymbol of: aClass
	"Purpose: set the INFO of aClass to be displayed on the opened spatial grid
Example : self displayInfo: #landUse of: Cell"
	
	self openedSpatialGrids
		do: [:interface | interface changeInfo: aSymbol ofEntity: aClass]	"self changed: #changeInfo: with: (DisplayPovChange forPov: aSymbol ofEntity: aClass)"