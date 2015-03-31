changing
changedTransition
	
	self transition value == #figure
		ifTrue: [self enableAll: #(#figureList)]
		ifFalse: [self disableAll: #(#figureList)].
	self transition value == #character
		ifTrue: [self enableAll: #(#characterList #characters #label)]
		ifFalse: [self disableAll: #(#characterList #characters #label)].
	self transition value == #toolCondition
		ifTrue: [self enableAll: #(#conditionList)]
		ifFalse: [self disableAll: #(#conditionList)]