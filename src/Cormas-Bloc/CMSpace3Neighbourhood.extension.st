Extension { #name : 'CMSpace3Neighbourhood' }

{ #category : '*Cormas-Bloc' }
CMSpace3Neighbourhood >> blocCellVerticesFor: aCell [

	^ (self shouldRotateShapeFor: aCell)
		  ifTrue: [
				  {
					  (0 @ 0).
					  (1 @ 0).
					  (0.5 @ 1) } ]
		  ifFalse: [
				  {
					  (0.5 @ 0).
					  (1 @ 1).
					  (0 @ 1) } ]
]
