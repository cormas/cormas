init
noAgent
	"initialize the space (from poor.env file) without agent"
	
	self spaceModel loadEnvironmentFromFile: 'poor.env'