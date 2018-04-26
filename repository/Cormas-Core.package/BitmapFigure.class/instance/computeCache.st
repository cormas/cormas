accessing
computeCache
	"recompute a cache using bitmap and ratio.
	resizing the bitmap requiert integer ratio.
	keep actual cache scale avoiding unecessary resize.
	"
	
	| s scaleFactor |
	s := self ratio * self scale.
	scaleFactor := s x min: s y.
	scaleFactor >= 1
		ifTrue:
			[scaleFactor := scaleFactor rounded.
			scaleFactor = cacheScaleFactor
				ifFalse:
					[cache := self bitmap magnifiedBy: scaleFactor asPoint.
					cacheScaleFactor := scaleFactor]]
		ifFalse:
			[scaleFactor := (1 / scaleFactor) rounded.
			1 / scaleFactor = cacheScaleFactor
				ifFalse:
					[cache := self bitmap shrunkenBy: scaleFactor asPoint.
					cacheScaleFactor := 1 / scaleFactor]].
	self setBoundsTo: self cache bounds