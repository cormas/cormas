accessing
truePerformerFor: aController
	
	^(adornment == nil or: [adornment truePerformerBlock == nil])
		ifTrue: [nil]
		ifFalse: [adornment truePerformerBlock value: aController]