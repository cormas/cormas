playback-log
closePlaybackLog: aStream
	"Close the playback log, writing the end of the XML stream"
	
	aStream
		nextPutAll: '</partie>';
		cr;
		close