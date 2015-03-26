+ pov
displayDefaultPovOf: aClass
	"Purpose: set the default POV of aClass to be displayed on the first opened spatial grid
Example : self displayDefaultPovOf: Cell"
	
	self displayPov: #povClassName of: aClass