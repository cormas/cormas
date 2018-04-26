accessing-Figures
celluleFigureAt: aPoint
	
	^(self allFiguresAt: aPoint)
		detect:
			[:fig | fig class ~= TrackFigure and: [fig entityType isSpatialEntityElementClass]]
		ifNone: [nil]