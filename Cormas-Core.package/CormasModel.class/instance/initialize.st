initalize release
initialize
	
	self timeStepValue onChangeSend: #timeChanged to: self.	"	self class spatialClasses isEmpty ifFalse: [self initializeSpaceModel]."	"NB ->retir√© pour que les cells ne demandent pas le currentSimulation spaceModel alors qu''il n''est pas encore fini d''initialis√©"
	self class socialClasses isEmpty ifFalse: [self initializeChannel].
	self applyModelDefaultCormasSettings