callbacks
exec1StepAction
	(CMPharoGridSimulation new
		on: self cormasModel
		withCells: self cormasModel spaceModelEntities
		withSituatedEntities: self cormasModel allTheSituatedEntities) runAndVisualize

	"(CMPharoGridSimulation new on: self cormasModel) 
			runAndVisualize."