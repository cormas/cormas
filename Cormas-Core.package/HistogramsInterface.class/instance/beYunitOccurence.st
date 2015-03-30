actions
beYunitOccurence
	
	| refreshView |
	refreshView := self yUnit value ~= #yunitOccurence.
	self yUnit value: #yunitOccurence.
	refreshView ifTrue: [self setNewHistoData]