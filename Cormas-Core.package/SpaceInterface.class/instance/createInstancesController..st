accessing
createInstancesController: anObject
	
	anObject ifNil: [self activateInspectTool].
	createInstancesController := anObject