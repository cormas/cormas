scheduling
initSimulation	
	self timeStep: 0.
	self spaceModel ifNil: [ self initializeSpaceModel ].
	"initialize probes data structure"
	self initDataStructures.
	"store the instances of entities in a collection and request an update of the space views at the end of the initialization"
	self setNewCollector.
	"remove the previous entities of the collections (theXXXs), except for theCells"
	self initEntities.
	"set default attributes values of entities"
	self defaultAttributesSetter reApplyNewValues.	"setAttributeNewValue"	"reApplyNewValues"
	"Call the selected INIT method"
	self perform: self activeInit.	"launch the selected INIT method"
	self updateEntities.	"updates theXXXs collections"
	self updateDataForChart.
	self channel isNil
		ifTrue: [ self initializeChannel ].
	self theAgentsComm do: [ :p | p channel: self channel ].
	self theAgentsComm isEmpty
		ifFalse: [ self channel population: self theAgentsComm ].
	"announce to all the subscribers that simulation is beeing initialized"
	self announcer announce:CMSimInitializationAnnouncement.
	^ self