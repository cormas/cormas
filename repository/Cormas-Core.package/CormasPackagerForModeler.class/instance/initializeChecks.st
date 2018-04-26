initialize-release
initializeChecks
	
	super initializeChecks.
	self
		addCheckName: #haveNoCurrentModelLoaded
		description: 'have no model loaded in the current image'
		action: [:p | p currentModel isNil]