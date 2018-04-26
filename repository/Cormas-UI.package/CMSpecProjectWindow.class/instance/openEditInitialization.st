callbacks
openEditInitialization
	" Open a browser tool to edit the receiver's model initialization "

	Smalltalk tools browser 
		openOnCategory: #init
		ofClass:self cormasModelClass
