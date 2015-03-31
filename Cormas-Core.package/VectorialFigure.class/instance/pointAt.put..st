accessing
pointAt: anIndex put: aValue
	
	(self isDistortable not
		and:
			[self container class = SpaceView | (self container class = SpaceViewZoom)])
		ifTrue: [^self].
	^super pointAt: anIndex put: aValue