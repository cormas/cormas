events
processMenuAt: aPoint centered: centered
	
	self view contextualMenu.
	super processMenuAt: aPoint centered: centered.
	self view mainInterface updateWindowName.
	self view mainInterface initMenuAttributs