control
delete
"Purpose: gets rid of this object. The collectGarbage is IMMEDIATELY performed  (ie. the receiver of class X is removed from 'theXXXs' collection)"

	self dead: true.
	self collector removeEntity: self