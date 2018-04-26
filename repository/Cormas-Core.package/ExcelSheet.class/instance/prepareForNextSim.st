navigation
prepareForNextSim
	
	self dataSavedByLine
		ifTrue:
			[self incrLine.
			self currentCol: 'A']
		ifFalse:
			[self incrColumn.
			self currentLine: 1]