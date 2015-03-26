actions
closeAccept
	"Allow the window to close if requestForWindowClose 
	answers true."
	
	self accept setValue: true.
	self cancel setValue: false.
	self close