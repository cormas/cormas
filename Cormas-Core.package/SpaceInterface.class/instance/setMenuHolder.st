menus
setMenuHolder
	"Set the Menu of the grid"
	
	menuHolder := self builder menuAt: #menuBar.	"menuHolder := self class menuBar asValue."
	self initMenuTopologie.
	self initMenuPov.
	self initMenuInfo.	"self initMenuDelimitor. A faire..."
	self initMenuAttributs.
	self initMenuTrack