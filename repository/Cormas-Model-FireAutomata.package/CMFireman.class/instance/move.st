as yet unclassified
move

	| firedNeighbours |
	firedNeighbours := self nearestLocationsVerifying: [:cell | cell state = #fire] withinRadius: 4.
	firedNeighbours isEmpty
		ifTrue: [self randomWalk]
		ifFalse: [
			"self leave."
			self moveTo: (Cormas selectRandomlyFrom: firedNeighbours)
		]