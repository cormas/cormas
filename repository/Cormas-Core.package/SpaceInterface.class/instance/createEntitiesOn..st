manipulate instances
createEntitiesOn: aFigure
	
	self createInstancesController ifNil: [^nil].
	self createInstancesController isCreatingInstancesManuallyLocated
		ifTrue:
			[self storeBeforeManipulation.
			self createInstancesController
				createInstancesOnCell: aFigure model entity]