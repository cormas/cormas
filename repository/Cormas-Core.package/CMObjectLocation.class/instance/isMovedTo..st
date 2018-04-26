+ moving
isMovedTo: aSpatialEntity
	"Purpose: moves to a given location.
Argument: aSpatialEntity = <SpatialEntity>
Example: self isMovedTo: self patch neighbourN"
	
	| alreadySituated |
	aSpatialEntity isSpatialEntity ifFalse: [^nil].
	alreadySituated := self isSituated.
	self leaveWhileMoving: true.
	self patch: aSpatialEntity.
	(self patch occupants: self class name) add: self.
	alreadySituated
		ifFalse:
			["the agent is arriving on the grid for the first time, the SpaceInterfaces should be aware"
			self currentSimulation
				registerEntityChange: #newOccupant
				with: (EntityReference on: aSpatialEntity)
				from: (EntityReference on: self)]
		ifTrue:
			[self currentSimulation
				registerEntityChange: #movingOccupant
				with: (EntityReference on: aSpatialEntity)
				from: (EntityReference on: self)]