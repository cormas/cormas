actions
closeCancel
	"Allow the window to close.  Do not send requestForWindowClose."
	
	self accept setValue: false.
	self cancel setValue: true.
	self close