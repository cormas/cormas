+ environment - picking - space
randomNeighbourVerifying: aCondition
	"Purpose: returns a neighbour randomly chosen among those verifying a given condition
Argument: aCondition = <BlockClosure>
Return value: <SpatialEntity | nil>"
	
	| candidates |
	candidates := self neighbourhood select: [:se | aCondition value: se].
	^candidates isEmpty
		ifTrue: [nil]
		ifFalse: [Cormas selectRandomlyFrom: candidates]