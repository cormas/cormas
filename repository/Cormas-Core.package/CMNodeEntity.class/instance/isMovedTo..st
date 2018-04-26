+ moving
isMovedTo: aSpatialEntity
	"Purpose: moves to a given location. If replaceNodeWhileMoving = true, then it will replace its own nodes by the previous ones.
Argument: aSpatialEntity = <SpatialEntity>
Example: self isMovedTo: self patch neighbourN"
	
	super isMovedTo: aSpatialEntity.
	self incomingArcs do: [:anArc | anArc newStopPosition: self patch].
	self outgoingArcs do: [:anArc | anArc newStartPosition: self patch].
	self checkToReplaceNode