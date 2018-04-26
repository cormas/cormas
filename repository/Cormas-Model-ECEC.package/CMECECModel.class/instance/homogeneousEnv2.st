instance-creation
homogeneousEnv2
	"initialize an homogeneous space (27x27, random biomass) with randomly located foragers"
	
	self spaceModel initializeRegularX: 27 Y: 27 shape: #squared nbNeighbours:
			#eight boundaries: #toroidal.
	self theCMECECVegetationUnits do: [:cell | cell initRandomBiomass].	"or: self initCells: #initRandomBiomass."
	self initAgents