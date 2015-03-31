events
isControlWanted
	
	^super isControlWanted	"	^self viewHasCursor and: [self model notNil]"