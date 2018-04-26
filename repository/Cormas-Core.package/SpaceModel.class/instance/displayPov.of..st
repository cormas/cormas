private - display
displayPov: aSymbol of: aClass
	"Purpose: set the POV of aClass to be displayed on the opened spatial grid
Example : self displayPov: #landUse of: Cell"
	
	self
		changed: #changePov
		with: (DisplayPovChange forPov: aSymbol ofEntity: aClass)