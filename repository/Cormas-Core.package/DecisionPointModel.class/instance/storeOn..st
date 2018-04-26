printing
storeOn: aStream
	
	| deps outgo incom build uiSess outTrue outFalse |
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
	outTrue := outgoingTrue.
	outgoingTrue := nil.
	outFalse := outgoingFalse.
	outgoingFalse := nil.
	[super storeOn: aStream]
		ensure:
			[self myDependents: deps.
			outgoing := outgo.
			incoming := incom.
			builder := build.
			uiSession := uiSess.
			outgoingTrue := outTrue.
			outgoingFalse := outFalse]