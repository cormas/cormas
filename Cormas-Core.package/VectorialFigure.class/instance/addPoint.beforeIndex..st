adding
addPoint: aPoint beforeIndex: aPosition
	
	| copy |
	(self isDistortable not
		and:
			[self container class = SpaceView | (self container class = SpaceViewZoom)])
		ifTrue: [^self].
	copy := Array new: points size + 1.
	1
		to: aPosition - 1
		do:
			[:i | 
			copy
				at: i
				put: (points at: i)].
	copy at: aPosition put: aPoint.
	aPosition
		to: points size
		do:
			[:i | 
			copy
				at: i + 1
				put: (points at: i)].
	points := copy.
	self updatePreferredBoundsWith: aPoint.
	^aPoint