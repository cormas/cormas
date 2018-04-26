adding-removing
addFigureForSpatialPov: aPOV
	"Add a copy of aPOV as a new Figure, adapted to my bounds.
The CloneFig is dependent of aPOV, its model
The method returns the added figure"
	
	| aFig |
	aFig := aPOV asFigure.
	self addFigure: aFig.
	(aPOV name ~= #nil and: [aPOV infoName ~= #nil])
		ifTrue: [aFig setText: aPOV infoResult].
	^aFig