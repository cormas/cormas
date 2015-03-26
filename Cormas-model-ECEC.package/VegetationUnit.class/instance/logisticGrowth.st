growth
logisticGrowth
	
	self
		biomass:
			(Cormas
				logisticGrowth: self biomass
				r: self class r
				K: self class K)