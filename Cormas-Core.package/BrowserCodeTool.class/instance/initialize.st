initialize-release
initialize
	
	super initialize.
	ChangeSet addDependent: self.
	modified := false