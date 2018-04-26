star testing
belongsToAggregate: aSpatialEntity
"Purpose: tests if the receiver belongs to a higher level spatial entity, even if theCSE is nil. 
This method is valid whatever the aggregate level and even if theCSE is nil. It will return 'true' if the receiver is a component of a component of aSpatialEntity
Argument: aSpatialEntity = <SpatialEntitySet>
Return value: <Boolean>"
	
	^aSpatialEntity containsCell: self