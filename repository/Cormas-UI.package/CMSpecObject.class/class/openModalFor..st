instance creation
openModalFor: aCMProjectManager 

	^ (self for: aCMProjectManager)
		initialize;
		openDialogWithSpec;
		centered;
		yourself