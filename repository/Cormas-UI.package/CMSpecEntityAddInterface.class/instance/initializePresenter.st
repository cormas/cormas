initialization
initializePresenter
	" Private - See superimplementor's comment "

	self setActionsForRb.
	self 
		bindKeyCombination: $o meta 
		toAction: [ self triggerOkAction ].
	self initializeEntityOptions.