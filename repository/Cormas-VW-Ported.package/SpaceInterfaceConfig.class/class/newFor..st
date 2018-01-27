instance creation
newFor: aSI
	
	| x |
	x := super new.
	x spaceInterface: aSI.
	x prepareSettings.
	^x