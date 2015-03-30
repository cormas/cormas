initialize-release
requestForWindowClose
	
	cormasModel := nil.
	self linkedSpaceInterface
		ifNotNil: [self linkedSpaceInterface manipInstancesController: nil].
	^super requestForWindowClose