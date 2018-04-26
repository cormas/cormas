initialization
initializeEntityOptions
	" EntityAdditionInterface>>postBuildWith: "

	self cormas spaceModel isNil "cellClass."
		ifTrue: [ 
			self entitySuperclass: CMSpatialEntityCell.
			"self cellOrCA value: #SpatialEntityElement."
			self rbEntityElementType enable.
			self rbSimpleCell enable.
			self rbCellularAutomaton enable.
			"(aBuilder componentAt: #LabelSpecialize) disable."
			self rbAggregate disable.
			self rbSetNoConnex disable ]