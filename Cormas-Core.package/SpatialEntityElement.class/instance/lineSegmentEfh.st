- displaying - obsolete
lineSegmentEfh
	
	| starts ends nE nSE nNE |
	starts := (Array with: self lineSegmentE start) asOrderedCollection.
	ends := (Array with: self lineSegmentE end) asOrderedCollection.
	nE := self neighbourE.
	(nE isNil or: [nE numCol - self numCol ~= 1])
		ifFalse:
			[starts add: nE lineSegmentW end.
			ends add: nE lineSegmentW start].
	nSE := self neighbourSE.
	(nSE isNil or: [nSE numLine - self numLine ~= 1])
		ifFalse: [ends add: nSE lineSegmentNE start].
	nNE := self neighbourNE.
	(nNE isNil or: [self numLine - nNE numLine ~= 1])
		ifFalse: [starts add: nNE lineSegmentSE end].
	^LineSegment
		from:
			(starts
				inject: 0
				into: [:i :each | i + each]) / starts size
		to:
			(ends
				inject: 0
				into: [:i :each | i + each]) / ends size