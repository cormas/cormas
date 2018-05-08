init
homogeneousEnv
	"initialize an homogeneous space (from poor.env file) with randomly located foragers"

	"self spaceModel loadEnvironmentFromFile: 'poor.env'."
	self createGridX: 15 Y: 27 neighbourhood: 8 closed: true.
	self theCMECECVegetationUnits do: [ :c |  c initRandomBiomass].
	self initAgents