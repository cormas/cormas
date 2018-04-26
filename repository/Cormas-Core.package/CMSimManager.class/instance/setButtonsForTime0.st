replay-private
setButtonsForTime0
	
	self simButtonAt: #stepBack displayActivated: false.
	self simButtonAt: #runBack displayActivated: false.
	enableBackward value
		ifFalse:
			[self simButtonAt: #replayRunForward displayActivated: false.
			self simButtonAt: #replayStepForward displayActivated: false]