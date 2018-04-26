+ environment - sensing - space
wayTo: anotherCell
	"Purpose: gets the shortest way to anotherCell
Argument: anotherCell = <SpatialEntityElement>
Return value: <Collection(SpatialEntityElement)>
Example: self wayTo: self spaceModel centralLocation"
	
	| shortestDistance path nearestCells shortestDistance2 nextCell |
	path := OrderedCollection new.
	self spaceModel gridCellShape = #irregular
		ifFalse:
			[path := self spaceModel wayFromCell: self toCell: anotherCell.
			path first = self ifTrue: [path removeFirst].
			^path].	"for irregular cells, the calculus is much more longer"
	path add: anotherCell.
	shortestDistance := self distanceTo: anotherCell.
	shortestDistance <= 1 ifTrue: [^path].	"First output condition"
	nearestCells := OrderedCollection new.
	shortestDistance2 := shortestDistance.
	anotherCell neighbourhood
		do:
			[:neighCell | 
			| dist |
			dist := self distanceTo: neighCell.
			dist < shortestDistance
				ifTrue:
					[dist < shortestDistance2
						ifTrue:
							[nearestCells := OrderedCollection new.
							shortestDistance2 := dist].
					nearestCells add: neighCell]].
	nextCell := Cormas selectRandomlyFrom: nearestCells.	"nextCell flash."
	path addAllFirst: (self wayTo: nextCell).	"Recursivity call"
	^path