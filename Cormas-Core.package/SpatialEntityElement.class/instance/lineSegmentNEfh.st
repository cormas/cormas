- displaying - obsolete
lineSegmentNEfh
	
	| starts ends nE nNE nNW |
	starts := (Array with: self lineSegmentNE start) asOrderedCollection.
	ends := (Array with: self lineSegmentNE end) asOrderedCollection.
	nE := self neighbourE.
	(nE isNil or: [nE numCol - self numCol ~= 1])
		ifFalse: [ends add: nE lineSegmentNW start].
	nNE := self neighbourNE.
	(nNE isNil or: [self numLine - nNE numLine ~= 1])
		ifFalse:
			[starts add: nNE lineSegmentSW end.
			ends add: nNE lineSegmentSW start].
	nNW := self neighbourNW.
	(nNW isNil or: [self numLine - nNW numLine ~= 1])
		ifFalse: [starts add: nNW lineSegmentE end].
	^LineSegment
		from:
			(starts
				inject: 0
				into: [:i :each | i + each]) / starts size
		to:
			(ends
				inject: 0
				into: [:i :each | i + each]) / ends size