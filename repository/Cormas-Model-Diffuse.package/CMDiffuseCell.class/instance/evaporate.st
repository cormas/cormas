control
evaporate
	self qty: (self qty - (self qty * CMDiffuseCell evaporationRate) max: 0)