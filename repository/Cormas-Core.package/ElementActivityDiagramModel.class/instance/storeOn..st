printing
storeOn: aStream
	
	| deps outgo incom build uiSess |
	deps := self myDependents.
	self myDependents: nil.
	outgo := self outgoing.
	outgoing := nil.
	incom := self incoming.
	incoming := nil.
	build := builder.
	builder := nil.
	uiSess := uiSession.
	uiSession := nil.
	[super storeOn: aStream]
		ensure:
			[self myDependents: deps.
			outgoing := outgo.
			incoming := incom.
			builder := build.
			uiSession := uiSess]