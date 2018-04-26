accessing
currentSimulation
	
	^currentSimulation ifNil: [currentSimulation := self allInstances first]