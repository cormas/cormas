"
I draw a cell with the shape required by its grid, according to its active point of view. On my own, I also draw the agents on the cell.

## Responsibility:

- Show the color and border of the point of view of my cell.
- Take the shape of my grid: a square, a hexagon or a triangle.
- Show the occupants of my cell, unless a group of cells draws the agents itself.

## Collaborators:

- `CMCell`: answers the point of view, the occupants and the grid.
- `CMBlAgentElement`: draws each occupant.

## Public API and Key Messages

- `for:` creates me with the occupants of the cell.
- `withoutOccupantsFor:` creates me with only the shape of the cell.
- `update` shows the current state of the cell.

```
(CMBlCellElement for: aCell) openInNewSpace
```

## Internal Representation

- `cell`: the cell I draw.
- `showsOccupants`: whether I draw the agents on the cell.
- `agentElements`: the elements of those agents.
"
Class {
	#name : 'CMBlCellElement',
	#superclass : 'CMBlElement',
	#instVars : [
		'cell',
		'showsOccupants',
		'agentElements'
	],
	#category : 'Cormas-Bloc',
	#package : 'Cormas-Bloc'
}

{ #category : 'examples' }
CMBlCellElement class >> exampleCellWithCow [

	<sampleInstance>
	| model |
	model := CMMockModel new.
	model initFixed.
	^ self for: (model entitiesOfClass: CMMockCow) first cell
]

{ #category : 'instance creation' }
CMBlCellElement class >> withoutOccupantsFor: aCell [

	^ self new
		  beWithoutOccupants;
		  setUpFor: aCell;
		  yourself
]

{ #category : 'initialization' }
CMBlCellElement >> beWithoutOccupants [

	showsOccupants := false
]

{ #category : 'accessing' }
CMBlCellElement >> cell [

	^ cell
]

{ #category : 'initialization' }
CMBlCellElement >> initialize [

	super initialize.
	showsOccupants := true.
	agentElements := #(  )
]

{ #category : 'updating' }
CMBlCellElement >> refresh [

	| pov extent |
	pov := cell activePov.
	extent := self cellExtentOf: cell.
	self
		background:
			(self backgroundOfPov: pov in: cell spaceModel extent: extent);
		border:
			(BlBorder
				 paint: pov borderColor
				 width: pov borderWidth * extent max).
	showsOccupants ifTrue: [ self refreshOccupants ]
]

{ #category : 'updating' }
CMBlCellElement >> refreshOccupants [

	| extent |
	extent := self cellExtentOf: cell.
	self removeChildren: agentElements.
	agentElements := cell allOccupants collect: [ :agent |
			                 (CMBlAgentElement for: agent)
				                 centerAt: agent positionInCell * extent;
				                 yourself ].
	self addChildren: agentElements
]

{ #category : 'initialization' }
CMBlCellElement >> setUpFor: aCell [

	| extent |
	cell := aCell.
	extent := self cellExtentOf: cell.
	self
		extent: extent;
		clipChildren: false;
		geometry: (BlPolygonGeometry vertices:
					 (((self neighbourhoodOf: cell) blocCellVerticesFor: cell)
						  collect: [ :each | each * extent ])).
	self refresh
]
