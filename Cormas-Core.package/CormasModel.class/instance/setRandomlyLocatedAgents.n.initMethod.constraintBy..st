deprecated
setRandomlyLocatedAgents: aClass n: aNumber initMethod: aSymbol constraintBy: aBlock
	
	^self createN: aNumber randomlyLocatedAgents: aClass initMethod: aSymbol
		arguments: #() constrainedBy: aBlock