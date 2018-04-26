- environment - sensing - space
nearestCellFromCells: aCollecOfCells constraintOnPath: aBlock
	"Return the nearest cell among aCollecOfCells"
	
	| minimum d target |
	minimum := self
		distanceTo: aCollecOfCells first
		constraintOnPath: aBlock.
	aCollecOfCells
		do:
			[:c | 
			d := self distanceTo: c constraintOnPath: aBlock.
			d <= minimum
				ifTrue:
					[minimum := d.
					target := c]].
	^target