menu - actions
saveRSTRDC
	
	| workingWindow |
	workingWindow := MenuSpaceInterfaces new initSaveRSTRDC: self spaceModel.
	workingWindow openDialog: #windowSaveRSTRDC with: self