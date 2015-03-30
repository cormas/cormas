actions while painting
resetColorByPainting
	
	self initializeByPainting.
	self linkedSpaceInterface view activeAttribute: #bidon.
	self linkedSpaceInterface view
		manipulatedEntity:
			(self cormasModel class classFromSymbol: self entity value asSymbol).
	self linkedSpaceInterface view manipulationAction: #resetColor