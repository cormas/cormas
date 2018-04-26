initalize release
release
	
	self spaceModel release.
	self spaceModel: nil.
	self channel isNil ifFalse: [self channel population: nil].
	self channel: nil.
	self timeStepValue retractInterestsFor: self.
	super release