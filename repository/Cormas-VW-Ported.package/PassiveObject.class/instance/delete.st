star control
delete
"Purpose: gets rid of this object. The collectGarbage is IMMEDIATELY performed  (ie. the receiver of class X is removed from 'theXXXs' collection)"
	self destroyed: true.
	self collector isNil ifFalse:[self collector removeEntity: self]