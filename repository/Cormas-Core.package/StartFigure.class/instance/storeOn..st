printing
storeOn: aStream
	
	| deps contain hand mod |
	deps := self myDependents.
	self myDependents: nil.
	contain := container.
	container := nil.
	hand := eventHandlers.
	eventHandlers := nil.
	mod := model.
	model := nil.
	[super storeOn: aStream]
		ensure:
			[self myDependents: deps.
			container := contain.
			eventHandlers := hand.
			model := mod]