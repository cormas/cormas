private
primCursorPointFor: anEvent
	
	^anEvent isMouseEvent
		ifTrue: [self sensor mousePointFor: anEvent]
		ifFalse: [self sensor cursorPoint]