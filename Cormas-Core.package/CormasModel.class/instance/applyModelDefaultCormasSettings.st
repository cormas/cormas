- simulation settings
applyModelDefaultCormasSettings
	
	self cormas isChangesDelayed = self class defaultDelayChangesSetting
		ifFalse: [self cormas toggleDelayChanges]