- displaying - obsolete
lineSegmentNWfh
	
	| starts ends nNE nNW nW |
	starts := (Array with: self lineSegmentNW start) asOrderedCollection.
	ends := (Array with: self lineSegmentNW end) asOrderedCollection.
	nW := self neighbourW.
	(nW isNil or: [self numCol - nW numCol ~= 1])
		ifFalse: [starts add: nW lineSegmentE start].
	nNE := self neighbourNE.
	(nNE isNil or: [self numLine - nNE numLine ~= 1])
		ifFalse: [ends add: nNE lineSegmentSW end].
	nNW := self neighbourNW.
	(nNW isNil or: [self numLine - nNW numLine ~= 1])
		ifFalse:
			[starts add: nNW lineSegmentSE end.
			ends add: nNW lineSegmentE end].
	^LineSegment
		from:
			(starts
				inject: 0
				into: [:i :each | i + each]) / starts size
		to:
			(ends
				inject: 0
				into: [:i :each | i + each]) / ends size