manipulate instances
openManipInstances
	
	self manipInstancesController
		ifNil: [ManipulateInstances openOnSpaceInterface: self]