optimize
initOptimize
	CMDiffuseCell scheduler: self.
	self activeCells: Set new.
	self newActiveCells: Bag new.
	self noMoreActiveCells: Bag new