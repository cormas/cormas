initialization
initializePresenter
	" Private - See superimplementor's comment "

	self populateManager.
	self tabManager whenTabSelected: [ 
		self changedExample ].