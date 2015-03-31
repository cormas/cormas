private - dispatch
dispatchOneCompoundSpatialEntity: anEntity
	"Gives the new entity to cormasModel and alarm the spaceInterfaces"
	
	self cormasModel collect: anEntity.
	self cormasModel
		registerEntityChange: #addAggregate
		with: (EntityReference onEntities: anEntity components)
		from: (EntityReference on: anEntity)