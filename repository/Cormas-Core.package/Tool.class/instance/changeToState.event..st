events
changeToState: aToolState event: anEvent
	
	aToolState isNil ifTrue: [^self].
	currentState := aToolState.
	Debug ifTrue: [self printDebuggingInformation].
	currentState == initialState ifTrue: [data := Dictionary new].
	[currentState evaluateIn: self event: anEvent]
		ifCurtailed: [currentState := initialState].	"Fail into the initialState"
	currentState isEndState
		ifTrue: [self changeToState: initialState event: anEvent]
		ifFalse:
			[| newState |
			newState := currentState immediateStateForEvent: anEvent tool: self.
			newState notNil ifTrue: [self changeToState: newState event: anEvent]]