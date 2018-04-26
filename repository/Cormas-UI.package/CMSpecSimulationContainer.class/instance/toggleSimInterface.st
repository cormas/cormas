accessing
toggleSimInterface

	self simInterfaceIsDisplayed
		ifTrue: [ self hideSimInterface ]
		ifFalse: [ self showSimInterface ]