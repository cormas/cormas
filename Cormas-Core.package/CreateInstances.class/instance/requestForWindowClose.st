initialize-release
requestForWindowClose
	
	cormasModel := nil.
	self linkedSpaceInterface
		ifNotNil: [self linkedSpaceInterface createInstancesController: nil].
	^super requestForWindowClose