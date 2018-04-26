actions while painting
inspectByPainting
	"Inspect each entity clicked by the user."
	
	self initializeByPainting.
	self linkedSpaceInterface view
		manipulatedEntity:
			(self entity value asSymbol) class.
	self linkedSpaceInterface view manipulationAction: #inspect