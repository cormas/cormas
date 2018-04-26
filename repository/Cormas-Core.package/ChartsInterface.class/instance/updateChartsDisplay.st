display
updateChartsDisplay
	
	| fromMem toMem |
	fromMem := self fromStep value.
	toMem := self toStep value.
	self
		initializeSlidersFrom: 0
		to: self nbPts - 1.
	self levelClassName = cormasModel class name
		ifTrue: [self updateGlobalChartsDisplay]
		ifFalse: [self updateLocalChartsDisplay].
	self fromStep value: fromMem.
	self toStep value: toMem.
	self zoom