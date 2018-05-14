examples - with SimManager
exampleSM1
	"In this example the SimManager is not used at all"

	| aModel finalTime chrono |
	aModel := self initialize new initSimulation.
	finalTime := 200.
	chrono := Time millisecondsToRun: [ finalTime timesRepeat: [ aModel runStep ] ].
	self displayRunDuration: chrono simName: 'a exampleSM1'.
	self transcriptShow_simulationTime: aModel timeStep nbRestrainedForagers: aModel restrainedSize