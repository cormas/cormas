simulation
endStep
	"Handle the end of the step"
	
	playbackLogStream isNil ifFalse: [self endStepPlaybackLog]