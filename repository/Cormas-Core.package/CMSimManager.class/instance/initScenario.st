init
initScenario
	
	self cormas cycle value: self finalStep value.
	self enableBackward: self enableBackwardValue value.	"*** initialize the simulation ***"
	self initializeSimulation.
	self keepOrReleaseRandomSeed