- displaying - obsolete
lineSegmentE
	
	^self segments notNil
		ifTrue: [self segments at: 2]
		ifFalse: [nil]