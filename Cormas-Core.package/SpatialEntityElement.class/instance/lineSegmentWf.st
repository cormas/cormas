- displaying - obsolete
lineSegmentWf
	
	| im d |
	im := self image component translatedBy: self center.	"self spaceModel delimiter ifFalse: [d := 0] ifTrue: [d := 1]."
	d := 0.
	self spaceModel gridCellShape = #squared
		ifTrue:
			[^LineSegment
				from: (im bottomLeft translatedBy: 0 @ d)
				to: im topLeft].
	self spaceModel gridCellShape = #hexagonal ifTrue: [^self lineSegmentWfh].
	^nil