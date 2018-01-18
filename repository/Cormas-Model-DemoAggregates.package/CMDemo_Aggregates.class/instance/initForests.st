init
initForests
	"Constructs the forest aggregates"

	self loadEnvironmentFromFile: '3forests.env'.
	self buildForests.
	self buildFragmentedEntitiesFromAggregates.
	self defaultDisplay