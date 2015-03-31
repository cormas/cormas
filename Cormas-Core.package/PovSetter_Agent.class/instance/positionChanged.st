changed
positionChanged
	"Display the figure at the right position on the virtualCell"
	
	| figurePosition |
	imageOS model position: occupantPosition value.
	self builder ifNil: [^self].
	(self builder componentAt: #virtualCell) bounds.
	(self builder componentAt: #boutonAppliquer) enable.	"figurePosition := imageOS figure calculateNewPositionOnPatchBounds: ((self builder componentAt: #virtualCell) bounds moveTo: -17 @ -19)."
	occupantPosition value = #topLeft ifTrue: [figurePosition := -17 @ -17].
	occupantPosition value = #leftCenter ifTrue: [figurePosition := -17 @ 0].
	occupantPosition value = #bottomLeft ifTrue: [figurePosition := -17 @ 17].
	occupantPosition value = #topRight ifTrue: [figurePosition := 17 @ -17].
	occupantPosition value = #rightCenter ifTrue: [figurePosition := 17 @ 0].
	occupantPosition value = #bottomRight ifTrue: [figurePosition := 17 @ 17].
	occupantPosition value = #topCenter ifTrue: [figurePosition := 0 @ -17].
	occupantPosition value = #center ifTrue: [figurePosition := 0 @ 0].
	occupantPosition value = #bottomCenter ifTrue: [figurePosition := 0 @ 17].
	occupantPosition value = #random ifTrue: [figurePosition := 4 @ 6].
	occupantPosition value = #border_topLeft
		ifTrue: [figurePosition := -25 @ -25].
	occupantPosition value = #border_leftCenter
		ifTrue: [figurePosition := -25 @ 0].
	occupantPosition value = #border_bottomLeft
		ifTrue: [figurePosition := -25 @ 25].
	occupantPosition value = #border_topRight
		ifTrue: [figurePosition := 25 @ -25].
	occupantPosition value = #border_rightCenter
		ifTrue: [figurePosition := 25 @ 0].
	occupantPosition value = #border_bottomRight
		ifTrue: [figurePosition := 25 @ 25].
	occupantPosition value = #border_topCenter
		ifTrue: [figurePosition := 0 @ -25].
	occupantPosition value = #border_bottomCenter
		ifTrue: [figurePosition := 0 @ 25].
	imageOS figure isBitmapFigure
		ifTrue: [imageOS figure translateTo: figurePosition]
		ifFalse:
			["it is a vectorialFigure"
			imageOS figure
				translateTo: figurePosition - (imageOS figure bounds extent / 2)].
	imageOS invalidate