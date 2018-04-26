+ accessing - scheduling
timeStep
	"Purpose: Returns the current time step of the simulation. Can be used by any entity of the model. 
Example: MyModel timeStep = 10 ifTrue:[self reproduce]"
	
	^timeStep ifNil: [timeStep := 0]