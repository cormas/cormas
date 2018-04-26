initialization
setToolbar
	self toolbar 
		firstButtonLabel: 'Help';
		firstButtonAction: [ self openHelp ];
		secondButtonLabel: 'Cancel';
		secondButtonAction: [ self delete ];
		thirdButtonLabel: 'Ok';
		thirdButtonAction: [ self addEntity. ]
