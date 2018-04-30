as yet unclassified
on: aModel withCells: cells withSituatedEntities: situatedEntities
	| windowSize |
	"self halt."
	"Create grid"
	model := aModel. 
	
	self addCells: cells.
	self addAgents: situatedEntities.
	
	self canvas camera focusOnCenterScaled.
	anim := RTActiveAnimation new.
	anim intervalInMilliseconds: (speed ifNil:[2]).
	anim
		blockToExecute: [ self runModelStep].
	anim inView: self.
	