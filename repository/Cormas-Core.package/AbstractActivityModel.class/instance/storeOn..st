printing
storeOn: aStream
	
	| deps outgo incom build uiSess actChoices selectAct |
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
	actChoices := self activityChoices.
	activityChoices := nil.
	selectAct := selectedActivity.
	selectedActivity := selectedActivity value.
	[super storeOn: aStream]
		ensure:
			[self myDependents: deps.
			outgoing := outgo.
			incoming := incom.
			builder := build.
			uiSession := uiSess.
			activityChoices := actChoices.
			selectedActivity := selectAct]