initialization
initializeWidgets
	" Private - See superimplementor's comment "

	self initializeBoxModels.
	validateBlock := [ :t | self ok enabled: t isEmpty not ].
	self initializeAuthorName.
	self initializeAuthorEmail.	
	self initializeAddButton.
	self focusOrder
		add: self authorName;
		add: self authorEmail;
		add: self ok