settings
adaptSettings
	"self adaptSettings   (called from the ''postLoadActions'') "
	
	self checkVwHomeDirectory.
	self setMessagesPath.
	self setSourceFilePath.
	self setCormasParcelPath.
	self setParcelPathForModels