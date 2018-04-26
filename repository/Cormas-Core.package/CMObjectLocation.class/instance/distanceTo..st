+ environment - distance
distanceTo: aSpatialEntityOrSituatedEntity
	"Purpose: returns the Manhattan distance (in cells) between the patch of the agent and aSpatialEntityOrSituatedEntity
If it is the distance to a situatedEntity, returrns the distance to the patch of this entity.
Argument: aSpatialEntityOrSituatedEntity = <SpatialEntity> or <AgentLocation> or <ObjectLocation>
Return value: <Integer>"
	
	self isSituated ifFalse: [^nil].
	aSpatialEntityOrSituatedEntity isSituated
		ifTrue: [^self patch distanceTo: aSpatialEntityOrSituatedEntity patch].
	aSpatialEntityOrSituatedEntity isSpatialEntity
		ifTrue: [^self patch distanceTo: aSpatialEntityOrSituatedEntity]