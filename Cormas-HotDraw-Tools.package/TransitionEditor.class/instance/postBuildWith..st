interface opening
postBuildWith: aBuilder
	
	super postBuildWith: aBuilder.
	self eventType onChangeSend: #changedEvent to: self.
	self transition onChangeSend: #changedTransition to: self.
	self
		changedEvent;
		changedTransition