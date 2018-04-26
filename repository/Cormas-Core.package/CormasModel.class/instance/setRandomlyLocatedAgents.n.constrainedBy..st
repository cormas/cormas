deprecated
setRandomlyLocatedAgents: aClass n: aNumber constrainedBy: aBlock
	
	^self createN: aNumber randomlyLocatedAgents: aClass initMethod: #init
		arguments: #() constrainedBy: aBlock