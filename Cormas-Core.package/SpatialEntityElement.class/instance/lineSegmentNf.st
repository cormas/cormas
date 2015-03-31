- displaying - obsolete
lineSegmentNf
	
	| im d |
	self spaceModel gridCellShape = #squared
		ifTrue:
			[im := self image component translatedBy: self center.	"self spaceModel delimiter ifFalse: [d := 0] ifTrue: [d := 1]."
			d := 0.
			^LineSegment
				from: im topLeft
				to: (im topRight translatedBy: d @ 0)].
	^nil