- displaying - obsolete
lineSegmentSWfh
	
	| starts ends nW nSE nSW |
	starts := (Array with: self lineSegmentSW start) asOrderedCollection.
	ends := (Array with: self lineSegmentSW end) asOrderedCollection.
	nW := self neighbourW.
	(nW isNil or: [self numCol - nW numCol ~= 1])
		ifFalse: [ends add: nW lineSegmentE end].
	nSE := self neighbourSE.
	(nSE isNil or: [nSE numLine - self numLine ~= 1])
		ifFalse: [starts add: nSE lineSegmentNW start].
	nSW := self neighbourSW.
	(nSW isNil or: [nSW numLine - self numLine ~= 1])
		ifFalse:
			[starts add: nSW lineSegmentNE end.
			ends add: nSW lineSegmentNW end].
	^LineSegment
		from:
			(starts
				inject: 0
				into: [:i :each | i + each]) / starts size
		to:
			(ends
				inject: 0
				into: [:i :each | i + each]) / ends size