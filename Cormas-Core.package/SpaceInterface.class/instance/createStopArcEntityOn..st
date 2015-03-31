manipulate instances
createStopArcEntityOn: aFigure
	
	self createInstancesController ifNil: [^nil].
	self createInstancesController isCreatingInstancesManuallyLocated
		ifTrue:
			[self createInstancesController createStopArcEntityOn: aFigure model entity]