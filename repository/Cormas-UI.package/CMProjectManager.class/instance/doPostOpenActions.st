callbacks
doPostOpenActions
	" Private - See superimplentor's comment "

	self updateNewProject: self cormasModelName.
	self fsm handleEvent: #actionOpened.