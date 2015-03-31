playback-log
openPlaybackLog
	
	playbackLogStream := (self class newPlaybackLogPath: model) writeStream.
	playbackLogStream
		nextPutAll: '<?xml version="1.0" encoding="ISO-8859-1" ?>';
		cr;
		nextPutAll:
				'<!DOCTYPE partie PUBLIC "partie-xml" "http://www-poleia.lip6.fr/~corbara/partie-xml.dtd">';
		cr;
		nextPutAll: '<partie>';
		cr