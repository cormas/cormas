changed
stopPositionChanged
	"Display the figure at the right position on the virtualCell"
	
	imageOS model stopPosition: stopPosition value	"	self builder ifNil: [^self].
	(self builder componentAt: #virtualCell) bounds.
	(self builder componentAt: #boutonAppliquer) enable."	"figurePosition := imageOS figure calculateNewPositionOnPatchBounds: ((self builder componentAt: #virtualCell) bounds moveTo: -17 @ -19)."	"startPosition value = #topLeft ifTrue: [figurePosition := -17 @ -17].
	startPosition value = #leftCenter ifTrue: [figurePosition := -17 @ 0].
	startPosition value = #bottomLeft ifTrue: [figurePosition := -17 @ 17].
	startPosition value = #topRight ifTrue: [figurePosition := 17 @ -17].
	startPosition value = #rightCenter ifTrue: [figurePosition := 17 @ 0].
	startPosition value = #bottomRight ifTrue: [figurePosition := 17 @ 17].
	startPosition value = #topCenter ifTrue: [figurePosition := 0 @ -17].
	startPosition value = #center ifTrue: [figurePosition := 0 @ 0].
	startPosition value = #bottomCenter ifTrue: [figurePosition := 0 @ 17].
	startPosition value = #random ifTrue: [figurePosition := 4 @ 6].

	startPosition value = #border_topLeft ifTrue: [figurePosition := -25 @ -25].
	startPosition value = #border_leftCenter ifTrue: [figurePosition := -25 @ 0].
	startPosition value = #border_bottomLeft ifTrue: [figurePosition := -25 @ 25].
	startPosition value = #border_topRight ifTrue: [figurePosition := 25 @ -25].
	startPosition value = #border_rightCenter ifTrue: [figurePosition := 25 @ 0].
	startPosition value = #border_bottomRight ifTrue: [figurePosition := 25 @ 25].
	startPosition value = #border_topCenter ifTrue: [figurePosition := 0 @ -25].
	startPosition value = #border_bottomCenter ifTrue: [figurePosition := 0 @ 25].

	imageOS figure translateTo: figurePosition - (imageOS figure bounds extent / 2).
	imageOS invalidate"