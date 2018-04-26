deprecated
setRandomlyLocatedObjects: aClass n: aNumber initMethod: aSymbol arguments: aCollec constrainedBy: aBlock
	
	^self createN: aNumber randomlyLocatedObjects: aClass initMethod: aSymbol
		arguments: aCollec constrainedBy: aBlock