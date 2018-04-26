private - dispatch
dispatchCompoundSpatialEntity: class
	"Gives the new entities to cormasModel and alarm the spaceInterfaces"
	
	self cormasModel
		setTheEntity: class
		with: (self spatialEntities at: class name).
	self cormasModel registerSpaceModelChange: #newAggregates with: class