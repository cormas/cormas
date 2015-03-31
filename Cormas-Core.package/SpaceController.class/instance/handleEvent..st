events
handleEvent: anEvent
	
	super handleEvent: anEvent	"ce n'est plus la peine de passer par l√†. Il faut utiliser Tool.
	(anEvent isKindOf: DoubleClickEvent) ifTrue:[self doubleClickEvent: anEvent].

	anEvent key == #enter ifTrue: [self currentTool cursor show].
	anEvent key == #exit ifTrue: [Cursor normal show].
	(anEvent isMouseEvent or: [anEvent isKeyboard]) 
		ifTrue: 
			[(self currentTool handleEvent: anEvent) 
				ifTrue: [self setAsCurrentConsumer]]"