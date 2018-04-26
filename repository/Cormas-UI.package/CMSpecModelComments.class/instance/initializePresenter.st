initialization
initializePresenter
	" Private - See superimplementor's comment "
	
	self versionName
		label: self translator tVersionName;
		ghostText: '1.0'.
	self creationDate 
		label: self translator tCreationDate;
		ghostText: Date today asString.
	self modelText
		label: self translator tModelComments.
	self toolbar 
"		firstButtonLabel: 'Cancel';
		firstButtonAction: [ self delete ];"
		firstButtonLabel: 'Ok';
		firstButtonAction: [ 
			self addModelComments.
			self delete ]