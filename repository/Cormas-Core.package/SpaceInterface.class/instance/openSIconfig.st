menu - actions
openSIconfig
	
	self siConfig ifNil: [self siConfig: (SpaceInterfaceConfig newFor: self)].
	self siConfig open