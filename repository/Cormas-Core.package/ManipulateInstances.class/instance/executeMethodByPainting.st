actions while painting
executeMethodByPainting
	"Executed a method on the entity clicked by the user."
	
	self initializeByPainting.
	self linkedSpaceInterface view
		manipulationAction: self controlMethod value asSymbol