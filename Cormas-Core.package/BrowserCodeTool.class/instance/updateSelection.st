private
updateSelection
	
	| interval |
	interval := self environment selectionIntervalFor: self text.
	interval isNil ifTrue: [^self].
	self
		selectFrom: interval first
		to: interval last