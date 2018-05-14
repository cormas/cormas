examples - with SimManager
exampleSM2
	"In this example the run of the simulation is managed by the SimManager"

	| aModel |
	aModel := self initialize new initSimulation.
	aModel simManager
		finalTime: 200;
		runSimulation.
			self transcriptShow_simulationTime:  aModel simManager currentTime nbRestrainedForagers: aModel restrainedSize 
	