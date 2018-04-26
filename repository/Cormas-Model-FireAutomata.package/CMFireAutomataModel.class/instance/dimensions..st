accessing
dimensions: aPair

	self initializeSpaceModel.

	self
		createGridX: aPair key
		Y: aPair value
		neighbourhood: 4
		closed: true.