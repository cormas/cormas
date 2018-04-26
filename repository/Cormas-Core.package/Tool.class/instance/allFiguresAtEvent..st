accessing
allFiguresAtEvent: anEvent
	
	| figures |
	^figures isNil
		ifTrue:
			[figures := (self drawing allFiguresAt: (self primCursorPointFor: anEvent))
				select:
					[:fig | fig class ~= TrackFigure and: [(fig isKindOf: SpaceView) not]]]
		ifFalse: [figures]