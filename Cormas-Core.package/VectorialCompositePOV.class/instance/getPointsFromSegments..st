delimitors
getPointsFromSegments: segmentsColl
	"returns a collection of points from a collectin of connected segments. The segmentsColl is reduced"
	
	| points initialSegment |
	points := OrderedCollection new.
	initialSegment := segmentsColl first.
	segmentsColl remove: initialSegment.
	points
		add: initialSegment start;
		add: initialSegment end.
	[initialSegment isNil or: [segmentsColl isEmpty]]
		whileFalse:
			[initialSegment := segmentsColl
				detect: [:seg | seg start = initialSegment end]
				ifNone: [nil].
			initialSegment isNil
				ifFalse:
					[segmentsColl remove: initialSegment.
					points last = initialSegment start
						ifFalse: [points add: initialSegment start]]].
	points add: points first copy.
	^points