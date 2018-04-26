actions
applyCurrentSettings
	
	self spaceInterface initMenuPov.
	self spaceInterface initMenuInfo.
	self applyDefaultPovs.
	self applyDefaultInfos.
	self perform: self delimiterSize value