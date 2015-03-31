adding-removing
addFigureForOccupantPov: aPov on: aESERef
	"Add the Figures of the Agent's POV.
Figures are adapted to my bounds and located on the center of the cell even if it is not loaded
returns the figure created"
	
	| aFig absolutePoint absolutePatchBounds |
	absolutePatchBounds := (self spaceModel elementaryEntitiesDefaultPovs
		at: aESERef entityId) bounds.
	aFig := aPov asFigure.
	self addFigure: aFig.
	absolutePoint := aFig calculateNewPositionOnPatchBounds:
			absolutePatchBounds.
	aFig moveTo: absolutePoint.
	aPov infoName = #nil ifFalse: [aFig setText: aPov infoResult].
	(self model trackedFigureTypes
		includes: aPov entityReference entityClass name) ifTrue: [aFig track].	"store the image association"
	self entityFiguresAt: aPov put: aFig.
	^aFig