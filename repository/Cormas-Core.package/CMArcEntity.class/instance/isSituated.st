star testing
isSituated
	"Purpose: tests the location somewhere in the spatial grid"
	^super isSituated.
	"self startNode isNil ifTrue: [^false].
	self stopNode isNil ifTrue: [^false].
	^(self startNode isSituated and:[self stopNode isSituated ])"