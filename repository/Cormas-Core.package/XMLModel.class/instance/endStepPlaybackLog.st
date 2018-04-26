playback-log
endStepPlaybackLog
	"Handle the end of the step for the log"
	
	playbackLogStream
		nextPutAll: '</step>';
		cr;
		flush