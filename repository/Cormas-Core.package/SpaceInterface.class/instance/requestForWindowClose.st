interface closing
requestForWindowClose
	
	Dev todo: 'Ces actions devraient √™tre dans un noticeOfWindowClose:'.
	spaceModel ifNotNil: [self spaceModel: nil].
	self manipInstancesController
		ifNotNil: [self manipInstancesController closeWithSpaceInterface].
	self createInstancesController
		ifNotNil: [self createInstancesController closeWithSpaceInterface].
	self siConfig ifNotNil: [self siConfig closeRequest].
	^super requestForWindowClose