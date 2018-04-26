compiling
createDefaultMethods
	
	self
		compile: 'initAgents\"To be completed"\	' withCRs
		classified: 'instance-creation'
		notifying: nil.
	self
		compile: 'init\"To be completed"\	self initCells.' withCRs
		classified: 'init'
		notifying: nil.
	self
		compile: 'step: t\"To be completed"\\ ' withCRs
		classified: 'control'
		notifying: nil