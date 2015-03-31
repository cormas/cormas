- displaying - obsolete
lineSegmentSf
	
	| im d |
	self spaceModel gridCellShape = #squared
		ifTrue:
			[im := self image component translatedBy: self center.	"self spaceModel delimiter ifFalse: [d := 0] ifTrue: [d := 1]."
			d := 0.
			^LineSegment
				from: (im bottomRight translatedBy: d @ d)
				to: (im bottomLeft translatedBy: 0 @ d)].
	^nil