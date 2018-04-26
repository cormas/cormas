- displaying - obsolete
segments
	
	| segments |
	segments := OrderedCollection new.
	(self image component translatedBy: self center) asPolyline
		edgesDo: [:i :j | segments add: (LineSegment from: i to: j)].
	^segments