playback-log
writeMoveToPlaybackLogOf: anAgent from: srcCell to: dstCell
	"Write to playback log that an agent moved"
	
	| agentID agentClass |
	agentID := anAgent id printString.
	agentClass := anAgent class name.
	playbackLogStream
		nextPutAll: '<laps>';
		cr.
	srcCell isNil
		ifTrue:
			[playbackLogStream
				nextPutAll:
						'<ajoutAgent id="' , agentID , '" classe="' , agentClass , '" idCase="'
								, dstCell id printString , '"/>';
				cr]
		ifFalse:
			[playbackLogStream
				nextPutAll:
						'<deplacerAgent id="' , agentID , '" classe="' , agentClass , '" from="'
								, srcCell id printString , '" to="' , dstCell id printString ,
									'"/>';
				cr].
	playbackLogStream
		nextPutAll: '</laps>';
		cr