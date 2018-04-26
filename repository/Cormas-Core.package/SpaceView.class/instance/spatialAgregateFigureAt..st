accessing-Figures
spatialAgregateFigureAt: aPoint
	
	^(self allFiguresAt: aPoint)
		detect: [:cf | cf isCompositeEntityFigure]
		ifNone: [nil]