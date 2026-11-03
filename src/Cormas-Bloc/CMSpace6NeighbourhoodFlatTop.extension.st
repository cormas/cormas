Extension { #name : 'CMSpace6NeighbourhoodFlatTop' }

{ #category : '*Cormas-Bloc' }
CMSpace6NeighbourhoodFlatTop >> blocCellProportions [

	^ 1 @ (3 sqrt / 2)
]

{ #category : '*Cormas-Bloc' }
CMSpace6NeighbourhoodFlatTop >> blocCellVerticesFor: aCell [

	^ {
		  (0.25 @ 0).
		  (0.75 @ 0).
		  (1 @ 0.5).
		  (0.75 @ 1).
		  (0.25 @ 1).
		  (0 @ 0.5) }
]
