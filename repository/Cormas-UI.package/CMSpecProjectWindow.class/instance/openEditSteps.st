callbacks
openEditSteps
	" Open a browser tool to edit the model steps "

	Smalltalk tools browser 
		openOnCategory: #control
		ofClass: self cormasModelClass 
		