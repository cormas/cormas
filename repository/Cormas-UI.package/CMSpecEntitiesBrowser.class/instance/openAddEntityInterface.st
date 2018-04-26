callbacks
openAddEntityInterface
	" Private - Callback for opening UI. The user clicked the add button to add a spatial entity "

	^ (CMSpecEntityAddInterface openFor: self projectManager)	
		owner: self spatialList;
		yourself

