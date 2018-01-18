init
setSingletonAggregatesFromRandomSeeds
	"Constructs 30 singleton groves from random seeds.
	Step = swellForests: t"

	"self spaceModel loadEnvironmentFromFile: '3forests.env'."
	self createSingletonAggregates: CMGrove
		fromSeeds: (self randomSeeds: 30).
	self ask: CMGrove toDo: #setForest.
	self displayPov: #povId of: CMGrove.
	self displayInfo: #info_surface of: CMGrove