actions_buttons
apply
	
	self checkSettings = self ifFalse: [^nil].
	self closeAndUnschedule.
	self openRunAnalysisWindow.
	self closeGraphicInterfaces