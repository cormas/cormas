control
connexity
	self spaceModel nbNeighbours = #eight
		ifTrue: [ ^ 8 ].
	self spaceModel nbNeighbours = #four
		ifTrue: [ ^ 4 ].
	self spaceModel nbNeighbours = #six
		ifTrue: [ ^ 6 ]