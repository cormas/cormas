menu
menuAt: aPoint
	"Figures have a menu that pops-up when clicked on by the yellow mouse button."
	
	| aMenuBuilder |
	aMenuBuilder := MenuBuilder new.	"menu for the local chart"
	aMenuBuilder add: 'chart' -> #openLocalChart.	"menu for the local INFO"
	self addInfoMenuTo: aMenuBuilder.	"menu for the local TRACK"
	self isMoveable ifTrue: [aMenuBuilder add: 'track' -> #trackFigure].	"menu for the model (image and Entity)"
	aMenuBuilder
		line;
		add: 'inspect...' -> #inspectEntity;
		add: 'visual inspector' -> #visualInspector;
		line.	"menu for changing color and line of the figure itself"	"NOT APPLICABLE To BitmapFigures"
	aMenuBuilder line.
	self addPoVMenuTo: aMenuBuilder.	"		aMenuBuilder line.
		aMenuBuilder add: 'fill color' -> #chooseFillColor.
		self addLineWidthMenuTo: aMenuBuilder.
		aMenuBuilder add: 'line color' -> #chooseLineColor."
	self addModelMenuTo: aMenuBuilder at: aPoint.
	^aMenuBuilder menu