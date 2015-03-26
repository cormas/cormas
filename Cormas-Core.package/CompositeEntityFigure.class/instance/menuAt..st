menu
menuAt: aPoint
	"Figures have a menu that pops-up when clicked on by the yellow mouse button."
	
	| aMenuBuilder |
	aMenuBuilder := MenuBuilder new.	"menu for the local chart"
	aMenuBuilder add: 'chart' -> #openLocalChart.
	self isMoveable ifTrue: [aMenuBuilder add: 'track' -> #trackFigure].	"menu for the local zoom window"
	self entityType isSpatialClass
		ifTrue: [aMenuBuilder add: 'zoom' -> #openZoom].	"menu for the model (image and Entity)"
	aMenuBuilder
		line;
		add: 'inspect...' -> #inspectEntity;
		add: 'visual inspector' -> #visualInspector;
		line.
	self addModelMenuTo: aMenuBuilder at: aPoint.
	^aMenuBuilder menu