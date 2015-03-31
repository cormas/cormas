accessing-Figures
allFiguresAt: aPoint
	
	^components select: [:comp | comp containsPoint: aPoint]