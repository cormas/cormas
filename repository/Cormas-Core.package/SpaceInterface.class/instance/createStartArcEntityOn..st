manipulate instances
createStartArcEntityOn: aFigure
	
	self createInstancesController ifNil: [^nil].
	self createInstancesController isCreatingInstancesManuallyLocated
		ifTrue:
			[self storeBeforeManipulation.
			self createInstancesController
				createStartArcEntityOn: aFigure model entity]