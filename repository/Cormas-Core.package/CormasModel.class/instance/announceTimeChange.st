announcement
announceTimeChange
	^self announcer announce: (CMTimeChangedAnnouncement timeStep:  self class timeStep) 