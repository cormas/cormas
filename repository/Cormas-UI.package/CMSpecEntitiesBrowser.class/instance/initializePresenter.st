initialization
initializePresenter
	" Private - See superimplementor's comment "

	self spatialList addActionBlock: [ self openAddEntityInterface ].
	self socialList addActionBlock: [ self openAddAgentInterface ].
	self passiveList addActionBlock: [ self openAddPassiveInterface ].
