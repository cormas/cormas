"
I am the abstract root of the elements that draw several cells in their grid positions.

## Responsibility:

- Place a cell element for each of my cells, keeping the arrangement of the grid.
- Fit my extent to those cells, with the first of them at my top-left corner.
- Rebuild the cell elements when my cells have changed.

## Collaborators:

- `CMBlCellElement`: draws each cell.

## Public API and Key Messages

- `update` shows the current state of the cells.
- Subclasses implement `cells`.

## Internal Representation

- `cellElements`: the elements of my cells.
- `gridOrigin`: the position on the grid that corresponds to my top-left corner.
"
Class {
	#name : 'CMBlCellGroupElement',
	#superclass : 'CMBlElement',
	#instVars : [
		'cellElements',
		'gridOrigin'
	],
	#category : 'Cormas-Bloc',
	#package : 'Cormas-Bloc'
}

{ #category : 'accessing' }
CMBlCellGroupElement >> cells [

	^ self subclassResponsibility
]

{ #category : 'initialization' }
CMBlCellGroupElement >> initialize [

	super initialize.
	cellElements := #(  ).
	gridOrigin := 0 @ 0.
	self clipChildren: false
]

{ #category : 'updating' }
CMBlCellGroupElement >> rebuildCellElements [
	"Draw my cells in their grid positions, with the first of them at my top-left corner"

	| positions corners |
	self removeChildren: cellElements.
	cellElements := self cells asArray collect: [ :each |
		                CMBlCellElement withoutOccupantsFor: each ].
	cellElements ifEmpty: [ ^ self extent: 0 @ 0 ].

	positions := cellElements collect: [ :each |
		             self gridPositionOfCell: each cell ].
	corners := positions
		           with: cellElements
		           collect: [ :position :each |
		           position + (self cellExtentOf: each cell) ].

	gridOrigin := positions
		              inject: positions first
		              into: [ :origin :each | origin min: each ].
	cellElements
		with: positions
		do: [ :each :position | each position: position - gridOrigin ].

	self
		extent: (corners
				 inject: corners first
				 into: [ :corner :each | corner max: each ]) - gridOrigin;
		addChildren: cellElements
]

{ #category : 'updating' }
CMBlCellGroupElement >> refresh [

	(cellElements collect: [ :each | each cell ]) asArray
	= self cells asArray
		ifTrue: [ cellElements do: [ :each | each refresh ] ]
		ifFalse: [ self rebuildCellElements ]
]

{ #category : 'initialization' }
CMBlCellGroupElement >> setUpFor: anObject [

	self refresh
]
