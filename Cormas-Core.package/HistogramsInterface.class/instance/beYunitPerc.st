actions
beYunitPerc
	
	| refreshView |
	refreshView := self yUnit value ~= #yunitPerc.
	self yUnit value: #yunitPerc.
	refreshView ifTrue: [self setNewHistoData]