accessing
spaceModel
	"return the current space model"
	
	self distributedMode value == #client ifTrue: [^self clientSpaceModel].
	^Cormas current currentSimulation spaceModel