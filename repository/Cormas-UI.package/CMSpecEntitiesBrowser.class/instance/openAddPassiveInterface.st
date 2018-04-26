callbacks
openAddPassiveInterface
	" Private - Callback for opening UI. The user clicked the add button to add a passive entity "
	
	^ (CMSpecPassiveAddInterface openFor: self projectManager)	
		owner: self passiveList;
		yourself
