initalize release
initializeSpaceModel
	
	self class cellClass ifNil: [^nil].
	self spaceModel: SpaceModel new.
	self spaceModel cormasModel: self.
	self spaceModel initialize.
	self spaceModel initializeRegular