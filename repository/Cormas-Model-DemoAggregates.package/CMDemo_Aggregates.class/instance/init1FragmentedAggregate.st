init
init1FragmentedAggregate
"Build 1 FragmentedForest of forested plots"
	self loadEnvironmentFromFile: '3forests.env'.
	self buildFragmentedEntitiesFromCells.
	self defaultDisplay.
	self displayPov: #nil of: CMGrove.
	self displayPov: #povId of: CMFragmentedForest