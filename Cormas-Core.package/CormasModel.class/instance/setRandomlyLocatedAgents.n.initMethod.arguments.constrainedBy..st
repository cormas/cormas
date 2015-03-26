deprecated
setRandomlyLocatedAgents: aClass n: aNumber initMethod: aSymbol arguments: aCollec constrainedBy: aBlock
	
	^self createN: aNumber randomlyLocatedAgents: aClass initMethod: aSymbol
		arguments: aCollec constrainedBy: aBlock