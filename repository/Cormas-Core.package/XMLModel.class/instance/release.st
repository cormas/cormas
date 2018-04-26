initialize-release
release
	
	super release.	"Close the playback stream, if any, and send quit message to the visualizer"
	xmlRpcClient isNil
		ifFalse:
			[| theClient |
			theClient := xmlRpcClient.
			xmlRpcClient := nil.
			[theClient perform: 'Visualizer.quit'.
			theClient release] fork].
	playbackLogStream isNil
		ifFalse:
			[| theStream |
			theStream := playbackLogStream.
			playbackLogStream := nil.
			self closePlaybackLog: theStream.
			theStream release]