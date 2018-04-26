+ environment - sensing - space
nearestCellVerifying: condition1 constraintOnPath: condition2
	"Purpose: returns the nearest cell verifying a specified condition1, the cells in between verifying another specified condition2.
Arguments: condition1 = <BlockClosure>
			condition2 = <BlockClosure>
Return value: <SpatialEntity | nil>
Example := self nearestCellVerifying: [:aCell | aCell hasWater] constraintOnPath: [:aCell | aCell isClosed not]"
	
	| collec minimum d target |
	collec := (self spaceModel spatialEntities at: self class name)
		select: [:c | condition1 value: c].
	collec isEmpty ifTrue: [^nil].
	minimum := self spaceModel line * self spaceModel column.
	collec
		do:
			[:c | 
			c ~= self
				ifTrue:
					[d := self distanceTo: c constraintOnPath: condition2.
					d < minimum
						ifTrue:
							[minimum := d.
							target := c]]].
	^target