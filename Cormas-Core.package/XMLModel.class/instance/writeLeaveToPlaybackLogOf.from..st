playback-log
writeLeaveToPlaybackLogOf: anAgent from: aCell
	"Write to playback log that an agent left"
	
	| agentID agentClass |
	agentID := anAgent id printString.
	agentClass := anAgent class name.
	playbackLogStream
		nextPutAll: '<laps>';
		cr;
		nextPutAll:
				'<supprAgent id="' , agentID , '" classe="' , agentClass , '" idCase="'
						, aCell id printString , '"/>';
		cr;
		nextPutAll: '</laps>';
		cr