changing
changedTool
	
	view clearSelections.
	(self currentTool)
		controller: self;
		selected.
	self currentTool cursor show.
	self setAsCurrentConsumer