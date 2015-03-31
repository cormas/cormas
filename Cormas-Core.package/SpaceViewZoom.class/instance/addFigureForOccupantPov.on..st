adding-removing
addFigureForOccupantPov: aPov on: aESERef
	"Add the Figures of the Agent's POV.
Figures are adapted to my bounds and located on the center of the cell even if it is not loaded"
	
	| aCloneFig patchBounds aPoint |
	patchBounds := (self spaceModel elementaryEntitiesDefaultPovs
		at: aESERef entityId) bounds.
	aCloneFig := aPov asFigure.	"aCloneFig scaleBy: (patchBounds extent / PovSetter standardCellBounds extent)."
	self addFigure: aCloneFig.
	aPoint := aCloneFig calculateNewPositionOnPatchBounds: patchBounds.	"aCloneFig moveTo: (aPoint * self zoomFactor value). "
	self moveOccupant: aCloneFig to: aPoint.	"(self model trackedFigureTypes includes:aPov entityReference entityClass name) ifTrue:[aFig track]."
	aPov infoName = #nil ifFalse: [aCloneFig setText: aPov infoResult].
	self entityFiguresAt: aPov put: aCloneFig.
	^aCloneFig