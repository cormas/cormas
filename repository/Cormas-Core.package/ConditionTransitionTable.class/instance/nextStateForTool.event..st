accessing
nextStateForTool: aTool event: anEvent
	
	1
		to: conditionMap size
		do:
			[:i | 
			| each |
			each := conditionMap at: i.
			each key = (aTool valueAt: #condition) ifTrue: [^each value]].
	^nil