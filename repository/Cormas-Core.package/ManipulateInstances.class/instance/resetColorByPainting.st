actions while painting
resetColorByPainting
	
	self initializeByPainting.
	self linkedSpaceInterface view activeAttribute: #bidon.
	self linkedSpaceInterface view
		manipulatedEntity:
			self entity value asSymbol class.
	self linkedSpaceInterface view manipulationAction: #resetColor