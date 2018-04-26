- displaying - obsolete
lineSegmentSEfh
	
	| starts ends nSE nSW nE |
	starts := (Array with: self lineSegmentSE start) asOrderedCollection.
	ends := (Array with: self lineSegmentSE end) asOrderedCollection.
	nE := self neighbourE.
	(nE isNil or: [nE numCol - self numCol ~= 1])
		ifFalse: [starts add: nE lineSegmentW start].
	nSE := self neighbourSE.
	(nSE isNil or: [nSE numLine - self numLine ~= 1])
		ifFalse:
			[starts add: nSE lineSegmentNW end.
			ends add: nSE lineSegmentNW start].
	nSW := self neighbourSW.
	(nSW isNil or: [nSW numLine - self numLine ~= 1])
		ifFalse: [ends add: nSW lineSegmentNE end].
	^LineSegment
		from:
			(starts
				inject: 0
				into: [:i :each | i + each]) / starts size
		to:
			(ends
				inject: 0
				into: [:i :each | i + each]) / ends size