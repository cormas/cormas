adding-removing
addFigureForArcPov: arcPov start: startCellReference end: endCellReference
	"Add the Figures of the Arc POV.
ArcFigures are located on the center of the startCell and the stopCell (even if it is not loaded)
returns the figure created"
	
	| origin arcFig final startCell |
	startCell := self spaceModel elementaryEntitiesDefaultPovs
		at: startCellReference entityId.
	origin := startCell center.
	final := (self spaceModel elementaryEntitiesDefaultPovs
		at: endCellReference entityId) center.
	arcFig := arcPov asFigure.
	arcFig start: origin stop: final.
	origin = final ifTrue: [arcFig addTwoPointOutside: startCell bounds].
	self addFigure: arcFig.
	arcPov infoName = #nil ifFalse: [arcFig setTextFor: arcPov infoResult].
	self entityFiguresAt: arcPov put: arcFig.
	^arcFig