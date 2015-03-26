deprecated
runStep: aStep
	"The main step method that activates the agents:
		- execute the selected STEP method (of the ScenarioBuilder Interface),
		- UPDATE the Entities (remove the dead ones and add the new ones in theXXs collections).
	(For display: Store the changed entities in a collection and request an update of the space views at the end of the timestep)"
	
	self
		delayChangesWhile:
			[self activeControl last = $:
				ifTrue:
					[self
						perform: self activeControl
						with: aStep]
				ifFalse: [self perform: self activeControl].
			self updateEntities].
	self channel notNil ifTrue: [self channel flush]