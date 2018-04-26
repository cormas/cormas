adding-removing
removeAllCompoundSpatialEntityFigures
	
	self
		removeAll:
			(self components select: [:f | f entityType isCompoundSpatialClass])