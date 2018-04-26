- obsolete
displayOn: aGC withString: aString
	
	self
		displayString: self displayInfos
		on: aGC.
	self halt.
	self displayOn: aGC