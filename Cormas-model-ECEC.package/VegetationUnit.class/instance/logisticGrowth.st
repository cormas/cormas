growth
logisticGrowth
	
	self
		biomass:
			(CormasOld
				logisticGrowth: self biomass
				r: self class r
				K: self class K)