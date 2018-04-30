callback
exec1StepAction

	self cormasModel initSimulation.
	(CMPharoGridSimulation new on:  self cormasModel withCells: self cormasModel spaceModelEntities withSituatedEntities: self cormasModel allTheSituatedEntities ) 
			runAndVisualize.
	
	"(CMPharoGridSimulation new on: self cormasModel) 
			runAndVisualize."