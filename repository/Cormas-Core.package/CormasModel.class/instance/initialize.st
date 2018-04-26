initalize release
initialize
	self timeStepValue whenChangedDo: [ self timeChanged ].	
		"self class spatialClasses isEmpty ifFalse: [self initializeSpaceModel]."	"NB ->retire pour que les cells ne demandent pas le currentSimulation spaceModel alors qu''il n''est pas encore fini d''initialise"
	self class socialClasses 
		ifNil: [ self class initializeWithoutVS ].
	self class socialClasses isEmpty ifFalse: [ self initializeChannel ].
	self applyModelDefaultCormasSettings