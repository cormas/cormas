interface closing
requestForWindowClose
	
	self showNo.
	linkedSI removeDependent: self.
	^super requestForWindowClose