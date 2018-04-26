accessing
cursorPointFor: anEvent
	
	| point |
	point := self primCursorPointFor: anEvent.
	^Grid isNil
		ifTrue: [point]
		ifFalse: [point // Grid * Grid]