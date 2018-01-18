init
init2AggregateLevels
"Build the 3 groves + the FragmentedForest. Each FragmentedForest is composed of groves having the same surface: 
	1 of 128 groves of 1 plot, 	1 of 49 groves of 2 plots, 	1 of 21 groves of 3 plots,
	1 of 1 grove of 240 plots, 	1 of 1 grove of 80 plots, 	1 of 2 groves of 4 plots,
	1 of 1 grove of 143 plots"
	self loadEnvironmentFromFile: '3forests.env'.
	self createAggregates: CMGrove from: CMPlot verifying: [:aCell | aCell tree].
	self theGroves do:[:ag| ag initNeighbourhood].
	self createFragmentedEntities: CMFragmentedForest from: CMGrove attribute: #size.
	self defaultDisplay.
	self displayPov: #nil of: CMGrove.
	self displayPov: #povId of: CMFragmentedForest