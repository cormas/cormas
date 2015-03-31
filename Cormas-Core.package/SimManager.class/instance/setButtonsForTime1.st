replay-private
setButtonsForTime1
	
	enableBackward value
		ifTrue:
			[self simButtonAt: #stepBack displayActivated: true.
			self simButtonAt: #runBack displayActivated: true]