+ environment - sensing - space
nearestCellVerifying: aBlock1 constraintOnPath: aBlock2
	"Purpose: returns the nearest cell verifying a specified condition1, the cells in between verifying another specified condition2.
Arguments: condition1 = <BlockClosure>
			condition2 = <BlockClosure>
Return value: <SpatialEntity | nil>
Example := self nearestCellVerifying: [:aCell | aCell hasWater] constraintOnPath: [:aCell | aCell isClosed not]"
	
	| collec target minimum d |
	collec := self spaceModel elementaryEntities
		select: [:c | aBlock1 value: c].
	collec ifNil: [^nil].
	target := collec first.
	minimum := self surround first shortestDistanceTo: target
		constraintOnPath: aBlock2.
	collec
		do:
			[:c | 
			self surround
				do:
					[:cs | 
					d := cs shortestDistanceTo: c constraintOnPath: aBlock2.
					d = 0 ifTrue: [^c].
					d < minimum
						ifTrue:
							[minimum := d.
							target := c]]].
	^target