menu - actions
saveASC
	
	| workingWindow |
	workingWindow := MenuSpaceInterfaces new
		initSaveASC: self cormasModelClass.
	workingWindow openDialog: #windowSaveASC with: self