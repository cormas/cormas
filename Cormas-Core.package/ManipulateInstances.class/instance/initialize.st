initialize-release
initialize
	
	self targetEntities onChangeSend: #targetEntitiesChanged to: self.
	self toBePerformed onChangeSend: #toBePerformedChanged to: self