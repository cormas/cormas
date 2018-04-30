instance-creation
initAgents
"To be completed"

	self setRandomlyLocatedAgents: CMFireman n: self numberOfFiremen.
	self generateSymetricNetworkDensity: 1 forAgents: CMFireman.