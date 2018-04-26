callback
exec1StepAction

	self cormasModel initSimulation.
	(CMPharoGridSimulation new on: self cormasModel) 
			runAndVisualize.