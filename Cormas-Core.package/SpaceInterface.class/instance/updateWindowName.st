drawing description
updateWindowName
	"Set the title of the grid window"
	
	self setBasicTitle.
	self builder window label: self basicTitle.
	self timeChanged