accessing
menuAt: aPoint
	"Figures have a menu that pops-up when clicked on by the yellow mouse button."
	
	| aMenuBuilder |
	self model entityReference ifNil: [^nil].
	aMenuBuilder := MenuBuilder new.	"menu for the local chart"
	aMenuBuilder add: 'chart' -> #openLocalChart.	"menu for the local INFO"
	self addInfoMenuTo: aMenuBuilder.
	self entityType isSpatialClass
		ifTrue:
			["menu for the local zoom window"
			aMenuBuilder add: 'zoom' -> #openZoom]
		ifFalse:
			["menu for the local TRACK"
			self isMoveable ifTrue: [aMenuBuilder add: 'track' -> #trackFigure]].
	aMenuBuilder line.	"menu for the model (image and Entity)"
	aMenuBuilder
		line;
		add: 'inspect...' -> #inspectEntity;
		add: 'visual inspector' -> #visualInspector;
		line.	"menu for changing color and line of the figure itself"
	aMenuBuilder line.
	self addPoVMenuTo: aMenuBuilder.
	aMenuBuilder add: 'fill color' -> #chooseFillColor.
	self addLineWidthMenuTo: aMenuBuilder.
	aMenuBuilder add: 'line color' -> #chooseLineColor.
	self addModelMenuTo: aMenuBuilder at: aPoint.
	^aMenuBuilder menu