accessing
enableBackward: bool
	
	enableBackward := bool.
	bool
		ifFalse: [self allReplayButtonsTo: false]
		ifTrue:
			[self currentTime = 0
				ifTrue: [self allReplayButtonsTo: false]
				ifFalse: [self allReplayButtonsTo: true]]