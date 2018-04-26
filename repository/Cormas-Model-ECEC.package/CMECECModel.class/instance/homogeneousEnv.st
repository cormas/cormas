init
homogeneousEnv
	"initialize an homogeneous space (from poor.env file) with randomly located foragers"

	self spaceModel loadEnvironmentFromFile: 'poor.env'.
	self initAgents