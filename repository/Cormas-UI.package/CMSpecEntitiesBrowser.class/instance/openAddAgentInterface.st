callbacks
openAddAgentInterface
	" Private - Callback for opening UI. The user clicked the add button to add a social entity "
	
	^ (CMSpecAgentAddInterface openFor: self projectManager)	
		owner: self socialList;
		yourself
