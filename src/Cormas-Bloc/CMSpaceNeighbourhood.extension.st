Extension { #name : 'CMSpaceNeighbourhood' }

{ #category : '*Cormas-Bloc' }
CMSpaceNeighbourhood >> blocCellVerticesFor: aCell [
	"Answer the vertices of aCell, with 0@0 and 1@1 as opposite corners of the box around it"

	^ {
		  (0 @ 0).
		  (1 @ 0).
		  (1 @ 1).
		  (0 @ 1) }
]
