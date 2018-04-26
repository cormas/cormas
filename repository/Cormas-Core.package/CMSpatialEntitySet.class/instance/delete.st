star testing
delete
"Purpose: gets rid of this object. The collectGarbage is IMMEDIATELY performed  (ie. the receiver of class X is removed from 'theXXXs' collection)"
	self components isEmpty ifFalse:[self deleteComponents: self components].
	self reset ; destroyed: true.
	self collector isNil ifFalse:[self collector removeEntity: self].
	self currentSimulation registerEntityChange: #removeEntity from: (EntityReference on:self)