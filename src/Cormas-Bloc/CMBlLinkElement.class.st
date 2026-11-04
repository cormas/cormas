"
I draw a link as a straight line between its two ends, in their grid positions. I am meant to be placed on top of the cells and aggregates, and below the agents.

## Responsibility:

- Draw a line from the position of the first end of my link to the position of the second one.
- Draw nothing while one of the ends is not on the grid, because the ends are the only source of my coordinates.
- Use the color and the size of the active point of view of my link, as a fraction of the cell like the size of an agent. A thin dark line when it specifies neither. Ignore its shape, tile and border.
- Draw an arrowhead at the second end when my link is directed, in the color of the line.
- Ignore mouse events, so that clicks and drags go to what is around me.

## Collaborators:

- `CMLink`: answers its two ends.
- `CMEntity`: each end tells whether it is on the grid, and where a line to it ends.
- `CMPointOfView`: tells which color and size were specified.

## Public API and Key Messages

- `for:` creates me for a link.
- `update` shows the current state of the link.
- `startPoint` and `endPoint` answer the ends of the line, in pixels, or nil while nothing is drawn.
- `moveEnd:to:` draws one end at a given position until the next update, as when an agent is being dragged.

```
(CMBlLinkElement for: aLink) openInNewSpace
```

## Internal Representation

- `link`: the link I draw.
- `startPoint`: where the line starts, in pixels, with 0@0 at the origin of the grid.
- `endPoint`: where the line ends, in the same coordinates.
- `arrowhead`: the corners of the arrowhead, or nil when there is none.
- `lineEnd`: where the drawn line stops, just inside the base of the arrowhead, so that it does not show behind the tip.

### Implementation Points

A line ends at the exact position of an agent, at the center of a cell, and at the average of the centers of the cells of an aggregate, which can fall outside a C-shaped or ring-shaped aggregate.

The line is centered on the positions, so half of its width and the arrowhead can extend outside my bounds.

The arrowhead grows with the thickness of the line, with a minimum size so that it can be seen on a thin line. An agent at the end of the line is drawn on top of it and can hide it.
"
Class {
	#name : 'CMBlLinkElement',
	#superclass : 'CMBlElement',
	#instVars : [
		'link',
		'startPoint',
		'endPoint',
		'arrowhead',
		'lineEnd'
	],
	#category : 'Cormas-Bloc',
	#package : 'Cormas-Bloc'
}

{ #category : 'examples' }
CMBlLinkElement class >> exampleBetweenTwoCells [

	<sampleInstance>
	| model |
	model := CMMockModel new.
	model initFixed.
	^ self for: (model
			   newEntity: CMMockRoad
			   from: (model cellAt: 1 at: 1)
			   to: (model cellAt: 3 at: 3))
]

{ #category : 'drawing' }
CMBlLinkElement >> aeDrawGeometryOn: aeCanvas [
	"Draw a line between the ends and an arrowhead instead of the geometry of an element"

	startPoint ifNil: [ ^ self ].
	self drawLineOn: aeCanvas.
	arrowhead ifNotNil: [ self drawArrowheadOn: aeCanvas ]
]

{ #category : 'geometry' }
CMBlLinkElement >> arrowheadVerticesWithWidth: aLineWidth [
	"Answer the corners of a triangle with its tip at the end of the line, large enough to be seen on a thin line. Ends at the same position have no direction, so they have no arrowhead"

	| length direction side base |
	startPoint = endPoint ifTrue: [ ^ nil ].
	length := aLineWidth * 3 max: 8.
	direction := endPoint - startPoint
	             / (endPoint distanceTo: startPoint).
	side := direction y negated @ direction x * (length / 2).
	base := endPoint - (direction * length).
	^ {
		  endPoint.
		  (base + side).
		  (base - side) }
]

{ #category : 'geometry' }
CMBlLinkElement >> centerOfCell: aCell [

	^ self centerOfPoints: (self verticesOfCell: aCell)
]

{ #category : 'geometry' }
CMBlLinkElement >> centerOfCells: aCollectionOfCells [

	^ self centerOfPoints:
		  (aCollectionOfCells collect: [ :each | self centerOfCell: each ])
]

{ #category : 'geometry' }
CMBlLinkElement >> centerOfPoints: aCollectionOfPoints [

	^ (aCollectionOfPoints
		   inject: 0 @ 0
		   into: [ :sum :each | sum + each ]) / aCollectionOfPoints size
]

{ #category : 'drawing' }
CMBlLinkElement >> drawArrowheadOn: aeCanvas [

	aeCanvas pathFactory: [ :cairoContext |
			cairoContext moveTo: arrowhead first.
			arrowhead allButFirstDo: [ :each | cairoContext lineTo: each ].
			cairoContext closePath ].
	self border paint aeApplyAsBackgroundTo: aeCanvas opacity: 1.
	aeCanvas
		setBorderOff;
		drawFigure
]

{ #category : 'drawing' }
CMBlLinkElement >> drawLineOn: aeCanvas [
	"Round caps fill the corner where two lines meet at an angle"

	aeCanvas
		pathFactory: [ :cairoContext |
				cairoContext
					moveTo: startPoint;
					lineTo: lineEnd ];
		setBackgroundOff;
		setOutskirtsCentered;
		setBorderBlock: [
				self border paint aeApplyTo: aeCanvas.
				aeCanvas
					setCapRound;
					setBorderWidth: self border width ];
		drawFigure
]

{ #category : 'accessing' }
CMBlLinkElement >> endPoint [

	^ endPoint
]

{ #category : 'geometry' }
CMBlLinkElement >> lineEndUnderArrowhead [
	"Answer a point just past the base of the arrowhead, so that there is no gap between them and the line does not show behind the tip"

	| base |
	base := arrowhead second + arrowhead third / 2.
	^ base + (endPoint - base / (endPoint distanceTo: base) * 0.5)
]

{ #category : 'accessing' }
CMBlLinkElement >> link [

	^ link
]

{ #category : 'updating' }
CMBlLinkElement >> moveEnd: anEntity to: aPoint [
	"Draw the end of the line at anEntity at a given position, before anEntity is there, as when it is being dragged"

	link from == anEntity ifTrue: [ startPoint := aPoint ].
	link to == anEntity ifTrue: [ endPoint := aPoint ].
	self refreshLine
]

{ #category : 'geometry' }
CMBlLinkElement >> positionOfLocatedEntity: anEntity [
	"Answer the position of anEntity inside its cell, where it is drawn"

	| cell |
	cell := anEntity cell.
	^ (self gridPositionOfCell: cell)
	  + (anEntity positionInCell * (self cellExtentOf: cell))
]

{ #category : 'updating' }
CMBlLinkElement >> refresh [

	| pov |
	pov := link activePov.
	self border: (BlBorder
			 paint: (pov hasColor
					  ifTrue: [ pov color ]
					  ifFalse: [ Color black ])
			 width: (pov hasSize
					  ifTrue: [ pov size * self cellSize ]
					  ifFalse: [ 1 ])).
	(link ends allSatisfy: [ :each | each isOnGrid ])
		ifTrue: [
				startPoint := link from linkEndIn: self.
				endPoint := link to linkEndIn: self.
				self refreshLine ]
		ifFalse: [
				startPoint := nil.
				endPoint := nil.
				arrowhead := nil.
				self
					extent: 0 @ 0;
					invalidate ]
]

{ #category : 'updating' }
CMBlLinkElement >> refreshLine [
	"Work out what to draw from the ends of the line"

	arrowhead := link isDirected ifTrue: [
		             self arrowheadVerticesWithWidth: self border width ].
	lineEnd := arrowhead
		           ifNil: [ endPoint ]
		           ifNotNil: [ self lineEndUnderArrowhead ].
	self
		extent: (startPoint max: endPoint);
		invalidate
]

{ #category : 'initialization' }
CMBlLinkElement >> setUpFor: aLink [
	"Clicks and drags go to what is around me"

	link := aLink.
	self preventMouseEvents.
	self refresh
]

{ #category : 'accessing' }
CMBlLinkElement >> startPoint [

	^ startPoint
]
