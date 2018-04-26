networking
on: aDistributionControl
	
	self resetCache.
	distributionControl := aDistributionControl.
	remoteSpaceModel := distributionControl currentSimulation spaceModel.
	remoteSpaceModel addDependent: self