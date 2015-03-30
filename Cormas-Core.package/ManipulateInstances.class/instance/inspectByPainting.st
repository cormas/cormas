actions while painting
inspectByPainting
	"Inspect each entity clicked by the user."
	
	self initializeByPainting.
	self linkedSpaceInterface view
		manipulatedEntity:
			(self cormasModel class classFromSymbol: self entity value asSymbol).
	self linkedSpaceInterface view manipulationAction: #inspect