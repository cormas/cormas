- initialize-release
destroyed: aBoolean
	
	super destroyed: aBoolean.
	aBoolean
		ifTrue:
			[startNode isNil ifFalse: [self startNode removeArc: self].
			stopNode isNil ifFalse: [self stopNode removeArc: self]]