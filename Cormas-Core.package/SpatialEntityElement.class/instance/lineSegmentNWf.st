- displaying - obsolete
lineSegmentNWf
	
	self spaceModel gridCellShape = #hexagonal ifTrue: [^self lineSegmentNWfh].
	^nil