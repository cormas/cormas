initialization
initialize
	" Set the receiver's inital state "

	super initialize.
	self applicationClass: CMApplicationProject.
	openStatus := false.
