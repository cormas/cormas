initalize release
initializeSpaceModel
	
	self class cellClass ifNil: [^nil].
	self spaceModel: SpaceModel basicNew.
	self spaceModel cormasModel: self.
	self spaceModel initialize.
	self spaceModel initializeRegular