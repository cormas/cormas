SpaceModel has not been commented.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.

Instance Variables:
	activeAttribute	<ByteSymbol>	Name of the attribute selected from the menu Tools -> Click to... -> Change attribute... -> 
	activeAttributeValue	<String>	Value entered when requested by the action just above
	activeSpatialEntity	<ClassName>	From the pov contextual menu, the spatial entity class that has been selected to be displayed
	arrayOrigins	<Array>	 Array of the points representing the centers of the matrix cells within the window coordinates system
	boundaries	<ByteSymbol>	either #toroidal or #closed
	cardinal	<Integer>	line * column, total number of cells defining the spatial grid
	column	<Integer>	number of columns of the spatial grid
	cormasModel	<CormasModel>	the instance of CormasModel connected to the spaceModel
	delimiter	<Integer>	0 for false, 1 for true: explicit separator lines between adjacent cells
	gridCellImage	<Wrapper>	Wrapper of a regular cell (depends on the size of the window)
	gridCellShape	<ByteSymbol>	#squared, #hexagonal or #irregular
	line	<Integer>	number of lines of the spatial grid
	nbNeighbours	<ByteSymbol>	#four, #six or #eight
	rMaxEntityImage	<Float>	
	spatialEntities	<Dictionary>	keys are class names of the different spatial entities of the coresponding CormasModel, values are lists of existing instances

