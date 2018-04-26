manipulate instances
openCreateInstances
	
	self createInstancesController
		ifNil: [CreateInstances openOnSpaceInterface: self]