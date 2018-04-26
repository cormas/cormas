private - notification
sendCellsToClientSpaceModels: cellsReference
	
	self myDependents update: #createCellsPovWithReferences with:
			cellsReference from: self