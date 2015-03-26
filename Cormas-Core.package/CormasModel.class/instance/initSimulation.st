scheduling
initSimulation
	
	self timeStep: 0.
	self spaceModel ifNil: [self initializeSpaceModel].
	self initDataStructures.
	self setNewCollector.	"store the changed entities in a collection and request an update of the space views at the end of the initialization"
	self
		delayChangesWhile:
			[self initEntities.	"remove the entities of the collections (theXXXs), except for theCells"	"self defaultAttributesSetter resetParameters."
			self defaultAttributesSetter reApplyNewValues.	"set attributes values of variables classes"	"Call the selected INIT method"
			self perform: self activeInit.	"launch the selected INIT method"
			self updateEntities].	"updates theXXXs collections"
	self updateDataForChart.
	self channel isNil ifTrue: [self initializeChannel].
	self theAgentsComm do: [:p | p channel: self channel].
	self theAgentsComm isEmpty
		ifFalse: [self channel population: self theAgentsComm].
	^self theAgentsComm