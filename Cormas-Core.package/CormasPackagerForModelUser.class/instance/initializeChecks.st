initialize-release
initializeChecks
	
	super initializeChecks.
	self
		addCheckName: #haveACurrentModelLoaded
		description: 'have a model loaded in the current image'
		action: [:p | p currentModel notNil]