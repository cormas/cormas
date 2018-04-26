init
fragmentedEnv
	"initialize an fragmented space (from fragmented.env file) with randomly located foragers"
	
	self spaceModel loadEnvironmentFromFile: 'fragmented.env'.
	self initAgents