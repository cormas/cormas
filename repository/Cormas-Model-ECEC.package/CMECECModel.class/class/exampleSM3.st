examples - with SimManager
exampleSM3
	"In this example the initialization and the run of the simulation is managed by the SimManager"

	| aModel |
	aModel := self initialize new.
	aModel simManager
		initializeSimulation;
		finalTime: 200;
		runSimulation.
	self
		transcriptShow_simulationTime: aModel simManager currentTime
		nbRestrainedForagers: aModel restrainedSize