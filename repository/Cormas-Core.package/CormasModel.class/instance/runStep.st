scheduling
runStep
	"The main step method that activates the agents:
		- INCREMENT the timeStep
		- EXECUTE the selected #Step method (of the ScenarioBuilder Interface) for the new timeStep,
		- UPDATE the Entities (remove the dead ones and add the new ones in theXXs collections).
	(For display: Store the changed entities in a collection and request an update of the space views at the end of the timestep)"
	
	self incrementTimeStep.
	self
		delayChangesWhile:
			[self activeControl last = $:
				ifTrue:
					[self
						perform: self activeControl
						with: self timeStepValue value]
				ifFalse: [self perform: self activeControl].
			self updateEntities].
	self channel notNil ifTrue: [self channel flush].
	self updateDataForChart