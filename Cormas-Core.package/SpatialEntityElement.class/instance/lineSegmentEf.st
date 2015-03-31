- displaying - obsolete
lineSegmentEf
	
	| im d |
	self spaceModel gridCellShape = #squared
		ifTrue:
			[im := self image component translatedBy: self center.	"self spaceModel delimiter ifFalse: [d := 0] ifTrue: [d := 1]."
			d := 0.
			^LineSegment
				from: (im topRight translatedBy: d @ 0)
				to: (im bottomRight translatedBy: d @ d)].
	self spaceModel gridCellShape = #hexagonal ifTrue: [^self lineSegmentEfh].
	^nil