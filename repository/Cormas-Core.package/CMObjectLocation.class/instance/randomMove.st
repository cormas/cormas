star moving
randomMove
"Purpose: moves to a spatial entity randomly picked from the direct neighbourhood (relative distance = 1) of the current location "

| destination |
	patch ifNil: [^nil].
	( patch neighbourhood isNil or: [ patch neighbourhood isEmpty])
		ifTrue: [self halt].
	destination := Cormas selectRandomlyFrom: patch neighbourhood.
	self isMovedTo: destination