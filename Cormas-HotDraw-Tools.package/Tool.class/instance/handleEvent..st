events
handleEvent: anEvent
	
	| nextState |
	figure := nil.
	nextState := currentState nextStateForEvent: anEvent tool: self.
	self changeToState: nextState event: anEvent.
	^nextState notNil