Extension { #name : 'CMSpace6NeighbourhoodPointyTop' }

{ #category : '*Cormas-Bloc' }
CMSpace6NeighbourhoodPointyTop >> blocCellProportions [

	^ 3 sqrt / 2 @ 1
]

{ #category : '*Cormas-Bloc' }
CMSpace6NeighbourhoodPointyTop >> blocCellVerticesFor: aCell [

	^ {
		  (0.5 @ 0).
		  (1 @ 0.25).
		  (1 @ 0.75).
		  (0.5 @ 1).
		  (0 @ 0.75).
		  (0 @ 0.25) }
]
