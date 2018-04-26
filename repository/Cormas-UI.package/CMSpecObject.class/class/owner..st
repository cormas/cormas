instance creation
owner: owner
	" Answer a new instance of the receiver configuring project settings "
	
	^ self basicNew
		owner: owner;
		projectManager: owner projectManager;
		initialize;
		yourself.