init
init
	self spaceModel loadEnvironmentFromFile: '40x40.env' withPov: #pov.
	self initOptimize.
	self initCells: #initEmpty.
	self setRandomlyLocatedAgents: CMDiffuseAnt n: self antNumber