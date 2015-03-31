menu - actions
loadASC
	
	| parametersWindow |
	parametersWindow := MenuSpaceInterfaces new openDialog: #windowASC with:
			self.
	parametersWindow initASCParametres: self cormasModelClass