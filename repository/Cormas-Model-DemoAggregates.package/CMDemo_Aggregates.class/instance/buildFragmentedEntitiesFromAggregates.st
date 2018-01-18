procedures
buildFragmentedEntitiesFromAggregates
	self spaceModel
		setFragmentedEntities: CMFragmentedForest
		from: CMGrove
		verifying: [:c | c size > 50]