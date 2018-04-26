actions
validateWindowGridSize
	
	self supervisor spaceModel resetSpatialEntities.
	self supervisor spaceModel
		line: self line value
		column: self column value.
	self supervisor spaceModel isIrregular
		ifTrue: [self supervisor spaceModel gridCellShape: #squared].
	self supervisor spaceModel createCells.	"self supervisor view createImages."
	self closeRequest