initialization
initializePresenter
	" Private - See superimplementor's comment "

	self toolbar 
		firstButtonLabel: self translator tCancel;
		firstButtonAction: [ self delete ];
		secondButtonLabel: self translator tApply;
		secondButtonAction: [ self halt ]