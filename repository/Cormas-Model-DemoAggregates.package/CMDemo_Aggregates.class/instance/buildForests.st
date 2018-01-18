procedures
buildForests
	"Create the Aggregates from trees. Each aggregate must be bigger than 25 cells (set the compactness)"
	self deleteSpatialEntitySet: CMGrove.
	self createAggregates: CMGrove from: CMPlot verifying: [:aCell | aCell tree] minimumSize: 25.
	self theGroves do: [:agg | agg initNeighbourhood].
	self spaceModel meanCompactness: CMGrove