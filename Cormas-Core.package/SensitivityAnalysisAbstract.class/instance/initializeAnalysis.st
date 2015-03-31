actions
initializeAnalysis
	
	self finalStep value > 0
		ifFalse:
			[^Dialog warn:
					'Please, enter a final step to set the duration of each simulation'].
	dataSaver isNil
		ifTrue:
			[self cormas
				warn:
					'All the output files will be saved in a single folder.\Please, create this folder ...'
						withCRs.
			self prepareFiles ifNil: [^nil]].
	self analysisProgress value: 0.
	self saveSettings