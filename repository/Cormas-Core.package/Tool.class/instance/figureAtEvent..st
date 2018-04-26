accessing
figureAtEvent: anEvent
	
	^figure isNil
		ifTrue:
			[figure := self drawing figureAt: (self primCursorPointFor: anEvent)]
		ifFalse: [figure]