initialization
initializeRbItems

	self rbEntityElementType
		label: self translator tElement;
		help: self translator tSpatialEntityCellHelp.
		
	self rbSimpleCell
		label: self translator tSimpleCell;
		help: self translator tSimpleCellHelp.
		
	self rbCellularAutomaton 
		label: self translator tCellularAutomaton;
		help: self translator tCellAutomatonHelp.
		
	self rbAggregate 
		label: self translator tAggregate;
		help: self translator tSpatialEntityHelp.
		
	self rbSetNoConnex 
		label: self translator tSetNotConnex;
		help: self translator tSetNotConnexHelp