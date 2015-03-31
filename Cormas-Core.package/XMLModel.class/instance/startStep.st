simulation
startStep
	"Handle the beginning of the step"
	
	playbackLogStream isNil ifFalse: [self startStepPlaybackLog]