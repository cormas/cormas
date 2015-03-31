interface opening
openWindowMifMid
	
	| parametersWindow |
	parametersWindow := MenuSpaceInterfaces new openDialog: #windowMifMid
		with: self.
	parametersWindow initSigParametres: self cormasModelClass