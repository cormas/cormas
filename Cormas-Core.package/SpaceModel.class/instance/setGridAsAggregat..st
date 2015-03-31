CSE (regular) - instance creation
setGridAsAggregat: compoundEntity
	"Creates one instance of compoundEntity from all the cells <SpatialEntityElement> of the grid.
	This method resets all aggregats 'compoundEntity' and rebuids them.
	compoundEntity : a Class name inheriting from <SpatialEntitySet>"
	
	^self
		setAggregates: compoundEntity
		from: self cormasModelClass cellClass
		verifying: [:c | true]