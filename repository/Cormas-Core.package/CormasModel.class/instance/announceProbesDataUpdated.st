announcement
announceProbesDataUpdated
	^self announcer announce: (CMProbesDataUpdatedAnnouncement timeStep:  self class timeStep) 