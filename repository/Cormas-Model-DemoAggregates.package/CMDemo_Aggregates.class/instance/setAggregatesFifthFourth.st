init
setAggregatesFifthFourth
	"Constructs a complete space partition by regular segmentation"

	self spaceModel loadEnvironmentFromFile: '3forests.env'.
	self createAggregates: CMGrove from: CMPlot horizontalDividers: 5 verticalDividers: 4.
	self defaultDisplay