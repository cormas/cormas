init
setAggregatesFromRandomSeeds
	"Constructs a complete space partition from seeds"

	self loadEnvironmentFromFile: '3forests.env'.
	self createAggregates: CMGrove
		fromSeeds: (self randomSeeds: 30)
		sizeDistribution: #(#(30 80) )
		"sizeDistribution: #(#(1 800) #(5 30) #(4 3) #(20 10))".
	self displayPov: #povId of: CMGrove.
	self displayInfo: #info_surface of: CMGrove