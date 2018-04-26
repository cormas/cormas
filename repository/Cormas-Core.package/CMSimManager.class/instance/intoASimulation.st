time
intoASimulation
	"return if the current sim is between the time range (0 - final time) "
	
	^(self currentTime = 0 or: [self finalTime <= self currentTime]) not