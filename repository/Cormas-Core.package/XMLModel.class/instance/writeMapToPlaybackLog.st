playback-log
writeMapToPlaybackLog
	"Output the current map on the playback log"
	
	playbackLogStream
		nextPutAll: '<map>';
		cr.
	model spaceModel elementaryEntities
		do:
			[:cell | 
			playbackLogStream
				nextPutAll: '<case>';
				cr.
			attributes
				do:
					[:att | 
					| type value |
					value := cell perform: (att at: #name) asSymbol.
					type := att at: #type.
					type = 'boolean'
						ifTrue:
							[value = true
								ifTrue:
									[playbackLogStream
										nextPutAll: '<true/>';
										cr]
								ifFalse:
									[playbackLogStream
										nextPutAll: '<false/>';
										cr]]
						ifFalse:
							[type = 'number'
								ifTrue:
									[value isNil
										ifTrue:
											[playbackLogStream
												nextPutAll: '<int>-1</int>';
												cr]
										ifFalse:
											[playbackLogStream
												nextPutAll: '<int>' , value printString , '</int>';
												cr]]
								ifFalse:
									["Not really subclass responsibility, but we need to extend this class here because
						the type encountered isn't either boolean or number"
									self subclassResponsibility]]].
			playbackLogStream
				nextPutAll: '</case>';
				cr].
	playbackLogStream
		nextPutAll: '</map>';
		cr