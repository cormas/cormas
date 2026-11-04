"
I draw a link as a straight line between its two ends, in their grid positions. I am meant to be placed on top of the cells and aggregates, and below the agents.

## Responsibility:

- Draw a line from the position of the first end of my link to the position of the second one.
- Draw nothing while one of the ends is not on the grid, because the ends are the only source of my coordinates.
- Ignore mouse events, so that clicks and drags go to what is around me.

## Collaborators:

- `CMLink`: answers its two ends.
- `CMEntity`: each end tells whether it is on the grid, and where a line to it ends.

## Public API and Key Messages

- `for:` creates me for a link.
- `update` shows the current state of the link.
- `startPoint` and `endPoint` answer the ends of the line, in pixels, or nil while nothing is drawn.

```
(CMBlLinkElement for: aLink) openInNewSpace
```

## Internal Representation

- `link`: the link I draw.
- `startPoint`: where the line starts, in pixels, with 0@0 at the origin of the grid.
- `endPoint`: where the line ends, in the same coordinates.

### Implementation Points

A line ends at the exact position of an agent, at the center of a cell, and at the average of the centers of the cells of an aggregate, which can fall outside a C-shaped or ring-shaped aggregate.

The line is centered on the positions, so half of its width can extend outside my bounds.
"
Class {
	#name : 'CMBlLinkElement',
	#superclass : 'CMBlElement',
	#instVars : [
		'link',
		'startPoint',
		'endPoint'
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
	"Draw a line between the ends instead of the geometry of an element"

	startPoint ifNil: [ ^ self ].
	aeCanvas
		pathFactory: [ :cairoContext |
				cairoContext
					moveTo: startPoint;
					lineTo: endPoint ];
		setBackgroundOff;
		setOutskirtsCentered;
		setBorderBlock: [
				self border paint aeApplyTo: aeCanvas.
				aeCanvas setBorderWidth: self border width ];
		drawFigure
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

{ #category : 'accessing' }
CMBlLinkElement >> endPoint [

	^ endPoint
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

	(link ends allSatisfy: [ :each | each isOnGrid ])
		ifTrue: [
				startPoint := link from linkEndIn: self.
				endPoint := link to linkEndIn: self.
				self extent: (startPoint max: endPoint) ]
		ifFalse: [
				startPoint := nil.
				endPoint := nil.
				self extent: 0 @ 0 ].
	self
		border: (BlBorder paint: Color black width: 1);
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
