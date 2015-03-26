deprecated
setRandomlyLocatedObjects: aClass n: aNumber constrainedBy: aBlock
	
	^self createN: aNumber randomlyLocatedObjects: aClass constrainedBy:
			aBlock