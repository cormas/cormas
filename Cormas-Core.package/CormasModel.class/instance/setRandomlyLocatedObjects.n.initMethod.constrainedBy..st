deprecated
setRandomlyLocatedObjects: aClass n: aNumber initMethod: aSymbol constrainedBy: aBlock
	
	^self createN: aNumber randomlyLocatedObjects: aClass initMethod: aSymbol
		arguments: #() constrainedBy: aBlock