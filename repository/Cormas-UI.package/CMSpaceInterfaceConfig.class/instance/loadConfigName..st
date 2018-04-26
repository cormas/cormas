actions
loadConfigName: aName
	
	self configName value: aName.
	self spaceInterface configName value: aName.
	self class
		loadSIconfig:
			(self spaceInterface cormasModelClass
				perform: ('SIconfig_' , aName) asSymbol)
		in: self
		ofModel: self spaceInterface cormasModel.
	self applyCurrentSettings.
	self setCheckMarksForDisplayOptionsMenu.
	self forceSItoApplyConfigTrackAgents