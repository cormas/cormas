menu-display options
applyTrackLengthValue: value
	
	| aClass |
	value = 'nil' ifTrue: [^nil].
	TrackFigure maxSize: value.
	self spaceInterface trackedFigureTypes
		do:
			[:symbol | 
			aClass := symbol class.
			(self spaceInterface drawing entityFiguresAt: aClass)
				do:
					[:fig | 
					(fig dependents select: [:tf | tf isKindOf: TrackFigure])
						do:
							[:track | 
							track testAndRemoveOrigine.
							track invalidate]]]