simulate
runSimulation
	"  Loop over the STEPs until simulation end. This take place into a treaded process (called from runSimulationThreaded).
	Display the Duration time on the Transcript"
	
	| chrono |
	chrono := Time millisecondsToRun: [self runSimulation_Basic].
	self simButtonAt: #run displayActivated: false.
	self displayRunDuration: chrono.
	processRun terminate.
	processRun := nil