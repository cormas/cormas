accessing-path
addOnsPath
	" Answer a <FileReference> corresponding to the path of 'Add-ons' directory "
	
	^ (self cormasPath / 'Add-ons') ensureCreateDirectory.

