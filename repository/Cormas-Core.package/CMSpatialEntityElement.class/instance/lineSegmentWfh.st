- displaying - obsolete
lineSegmentWfh
	
	| starts ends nW nSW nNW |
	starts := (Array with: self lineSegmentW start) asOrderedCollection.
	ends := (Array with: self lineSegmentW end) asOrderedCollection.
	nW := self neighbourW.
	(nW isNil or: [self numCol - nW numCol ~= 1])
		ifFalse:
			[starts add: nW lineSegmentSE start.
			ends add: nW lineSegmentE start].
	nSW := self neighbourSW.
	(nSW isNil or: [nSW numLine - self numLine ~= 1])
		ifFalse: [starts add: nSW lineSegmentNW end].
	nNW := self neighbourNW.
	(nNW isNil or: [self numLine - nNW numLine ~= 1])
		ifFalse: [ends add: nNW lineSegmentSW start].
	^LineSegment
		from:
			(starts
				inject: 0
				into: [:i :each | i + each]) / starts size
		to:
			(ends
				inject: 0
				into: [:i :each | i + each]) / ends size