SI config
loadSilentltySIConfigName: aSymbol
	
	self siConfig
		ifNil:
			[self siConfig: (SpaceInterfaceConfig newFor: self withConfig: aSymbol)].
	self siConfig applyCurrentSettings.
	self siConfig forceSItoApplyConfigTrackAgents.
	self siConfig siMenuFormat value ~= #siMenuFull
		ifTrue: [self siConfig reopenSI]