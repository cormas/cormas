initialization
initialize
	| t |
	super initialize.
	self cormasModel announcer
		subscribe: CMProbesDataUpdatedAnnouncement
			do: [ :aAnnounce | 
			aAnnounce timeStep = 0
				ifFalse: [ self timeChanged: aAnnounce timeStep ] ];
		subscribe: CMSimInitializationAnnouncement do: [ self timeChanged: 0 ].
	self addAZeroDataSet