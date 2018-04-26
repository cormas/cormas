initialize-release
release
	
	ChangeSet removeDependent: self.
	builder := nil.
	super release