decisions sheets
resetDecisionsSheet
	
	self playersScheduling selection = self lineSep
		ifTrue: [^self playersScheduling selection: nil].
	self playersScheduling selection isNil
		ifTrue: [self setBlocksInvisible]
		ifFalse: [self resetDecisionsSheet: self playersScheduling selection]