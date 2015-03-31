changed
listMethodsChanged
	"some methods has changed. Rebuild the menu (added while removing the spaceInterfaces from cormas)"
	
	self spaceModel ifNotNil: [self initMenuPov]