as yet unclassified
move

	| firedNeighbours |
	firedNeighbours := self patch neighbourhood select: [:cell | cell state = #fire].
	firedNeighbours isEmpty
		ifTrue: [self randomWalk]
		ifFalse: [
			self leave.
			self moveTo: (Cormas selectRandomlyFrom: firedNeighbours)
		]