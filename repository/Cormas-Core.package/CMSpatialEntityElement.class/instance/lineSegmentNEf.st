- displaying - obsolete
lineSegmentNEf
	
	self spaceModel gridCellShape = #hexagonal ifTrue: [^self lineSegmentNEfh].
	^nil