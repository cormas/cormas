optimize
updateActiveCells
	self activeCells addAll: self newActiveCells.
	self activeCells removeAll: self noMoreActiveCells.
	self newActiveCells: Set new.
	self noMoreActiveCells: Set new