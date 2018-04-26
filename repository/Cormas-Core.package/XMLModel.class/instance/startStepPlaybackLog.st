playback-log
startStepPlaybackLog
	"Handle the beginning of the step for the log"
	
	playbackLogStream
		nextPutAll: '<step>';
		cr