callbacks
runAction
	self cormasModel spaceModelEntities
		ifNil: [ ^ self alertMessage: 'The spaceModel is  not yet initialized' ]
		ifNotNil:
			[ :aSetOfentities | aSetOfentities ifEmpty: [ ^ self alertMessage: 'The simulation has no spatial entities' ] ].
	(CMSimulationGrid new
		on: self cormasModel
		withCells: self cormasModel spaceModelEntities
		withSituatedEntities: self cormasModel allTheSituatedEntities) runAndVisualize

	"(CMPharoGridSimulation new on: self cormasModel) 
			runAndVisualize."