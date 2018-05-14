instance creation
on: aModel withCells: cells withSituatedEntities: situatedEntities
	"This method is called by the CMSpecSimulationWindow. It launches the RTActiveAnimation (replacement of spaceInterface)"

	model := aModel.
	self addViewForCells: cells.
	self addViewForAgents: situatedEntities.
	self canvas camera focusOnCenterScaled.
	anim := RTActiveAnimation new.
	anim intervalInMilliseconds: (speed ifNil: [ 0 ]).
	anim
		blockToExecute: [ self runModelStep ].
	anim inView: self