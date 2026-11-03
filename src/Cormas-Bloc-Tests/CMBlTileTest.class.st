"
I check that cells and agents show the tile of their point of view, by reading pixels.

## Responsibility:

- Check which form of a tile is used for each grid size.
- Check how a tile is fitted into a cell or an agent.
- Check that `update` follows a change between a tile and a color.

## Collaborators: 

- `CMTile`: I build tiles whose forms can be told apart by color.
- `CMBlTestCell` and `CMBlTestAgent`: entities with the point of view I choose.
"
Class {
	#name : 'CMBlTileTest',
	#superclass : 'CMBlTestCase',
	#category : 'Cormas-Bloc-Tests',
	#package : 'Cormas-Bloc-Tests'
}

{ #category : 'private' }
CMBlTileTest >> agentWithTile: aTile [

	^ (model newEntity: CMBlTestAgent)
		  testPov: ((CMPointOfView tile: aTile size: 1)
				   shape: #square;
				   yourself);
		  yourself
]

{ #category : 'private' }
CMBlTileTest >> cellWithTile: aTile rows: aNumber neighbourhood: aNeighbourhood [

	model := CMMockModel new.
	model cellClass: CMBlTestCell.
	model
		createGridNumberOfRows: aNumber
		numberOfColumns: 2
		neighbourhood: aNeighbourhood
		closed: true.
	model cells do: [ :each | each testPov: (CMPointOfView tile: aTile) ].
	^ model cellAt: 1 at: 1
]

{ #category : 'private' }
CMBlTileTest >> halfRedHalfBlueTile [
	"Answer a tile that is red on its left half and blue on its right half"

	| form |
	form := Form extent: 32 @ 32 depth: 32.
	form fill: (0 @ 0 extent: 16 @ 32) fillColor: Color red.
	form fill: (16 @ 0 extent: 16 @ 32) fillColor: Color blue.
	^ self
		  tileWithLarge: form
		  medium: form
		  small: form
		  verySmall: form
]

{ #category : 'private' }
CMBlTileTest >> solidForm: aColor [

	^ (Form extent: 32 @ 32 depth: 32)
		  fillColor: aColor;
		  yourself
]

{ #category : 'tests' }
CMBlTileTest >> testAgentNotInAModelUsesTheLargeForm [

	| agent |
	model := CMMockModel new.
	agent := CMBlTestAgent new.
	agent testPov:
		((CMPointOfView tile: self tileOfOneColorPerSize size: 1)
			 shape: #square;
			 yourself).

	self
		assert: (self hexColorIn: (CMBlAgentElement for: agent) at: 16 @ 16)
		equals: 'FF0000'
]

{ #category : 'tests' }
CMBlTileTest >> testAgentTileIsCutToTheShape [

	| agent element |
	self gridWithNeighbourhood: 4.
	agent := self agentWithTile: self halfRedHalfBlueTile.
	agent pov shape: #circle.

	element := CMBlAgentElement for: agent.

	self assert: (self hexColorIn: element at: 8 @ 16) equals: 'FF0000'.
	self assert: (self isTransparentIn: element at: 1 @ 1)
]

{ #category : 'tests' }
CMBlTileTest >> testAgentTileIsScaledToItsSize [

	| agent element |
	self gridWithNeighbourhood: 4.
	agent := self agentWithTile: self halfRedHalfBlueTile.
	agent pov size: 0.5.

	element := CMBlAgentElement for: agent.

	self assert: (self hexColorIn: element at: 4 @ 8) equals: 'FF0000'.
	self assert: (self hexColorIn: element at: 12 @ 8) equals: '0000FF'
]

{ #category : 'tests' }
CMBlTileTest >> testAgentUsesTheFormForItsGridSize [

	| agent |
	self
		cellWithTile: self tileOfOneColorPerSize
		rows: 10
		neighbourhood: 4.
	agent := self agentWithTile: self tileOfOneColorPerSize.

	self
		assert: (self hexColorIn: (CMBlAgentElement for: agent) at: 16 @ 16)
		equals: '0000FF'
]

{ #category : 'tests' }
CMBlTileTest >> testCellShowsItsTile [

	| cell element |
	cell := self
		        cellWithTile: self halfRedHalfBlueTile
		        rows: 3
		        neighbourhood: 4.

	element := CMBlCellElement for: cell.

	self assert: (self hexColorIn: element at: 8 @ 16) equals: 'FF0000'.
	self assert: (self hexColorIn: element at: 24 @ 16) equals: '0000FF'
]

{ #category : 'tests' }
CMBlTileTest >> testCellTileIsCutToTheCell [

	| cell element |
	cell := self
		        cellWithTile: self halfRedHalfBlueTile
		        rows: 3
		        neighbourhood: #pointy6.

	element := CMBlCellElement for: cell.

	self assert: (self isTransparentIn: element at: 2 @ 2).
	self assert: (self hexColorIn: element at: 8 @ 16) equals: 'FF0000'
]

{ #category : 'tests' }
CMBlTileTest >> testCellUsesLargeFormBelowFiveRows [

	| cell |
	cell := self
		        cellWithTile: self tileOfOneColorPerSize
		        rows: 4
		        neighbourhood: 4.

	self
		assert: (self hexColorIn: (CMBlCellElement for: cell) at: 16 @ 16)
		equals: 'FF0000'
]

{ #category : 'tests' }
CMBlTileTest >> testCellUsesMediumFormBelowTenRows [

	| cell |
	cell := self
		        cellWithTile: self tileOfOneColorPerSize
		        rows: 9
		        neighbourhood: 4.

	self
		assert: (self hexColorIn: (CMBlCellElement for: cell) at: 16 @ 16)
		equals: '00FF00'
]

{ #category : 'tests' }
CMBlTileTest >> testCellUsesSmallFormBelowFifteenRows [

	| cell |
	cell := self
		        cellWithTile: self tileOfOneColorPerSize
		        rows: 14
		        neighbourhood: 4.

	self
		assert: (self hexColorIn: (CMBlCellElement for: cell) at: 16 @ 16)
		equals: '0000FF'
]

{ #category : 'tests' }
CMBlTileTest >> testCellUsesVerySmallFormFromFifteenRows [

	| cell |
	cell := self
		        cellWithTile: self tileOfOneColorPerSize
		        rows: 15
		        neighbourhood: 4.

	self
		assert: (self hexColorIn: (CMBlCellElement for: cell) at: 16 @ 16)
		equals: 'FFFF00'
]

{ #category : 'tests' }
CMBlTileTest >> testTileIsCenteredInANarrowCell [
	"A pointy-top hexagon is narrower than the tile, which loses the same amount on both sides"

	| cell element |
	cell := self
		        cellWithTile: self halfRedHalfBlueTile
		        rows: 3
		        neighbourhood: #pointy6.

	element := CMBlCellElement for: cell.

	self assert: (self hexColorIn: element at: 12 @ 16) equals: 'FF0000'.
	self assert: (self hexColorIn: element at: 15 @ 16) equals: '0000FF'
]

{ #category : 'tests' }
CMBlTileTest >> testUpdateChangesFromColorToTile [

	| cell element |
	cell := self
		        cellWithTile: self halfRedHalfBlueTile
		        rows: 3
		        neighbourhood: 4.
	cell testPov: (CMPointOfView color: Color green).
	element := CMBlCellElement for: cell.
	self assert: (self hexColorIn: element at: 8 @ 16) equals: '00FF00'.

	cell testPov: (CMPointOfView tile: self halfRedHalfBlueTile).
	element update.

	self assert: (self hexColorIn: element at: 8 @ 16) equals: 'FF0000'
]

{ #category : 'tests' }
CMBlTileTest >> testUpdateChangesFromTileToColor [

	| cell element |
	cell := self
		        cellWithTile: self halfRedHalfBlueTile
		        rows: 3
		        neighbourhood: 4.
	element := CMBlCellElement for: cell.

	cell testPov: (CMPointOfView color: Color green).
	element update.

	self assert: (self hexColorIn: element at: 8 @ 16) equals: '00FF00'
]

{ #category : 'private' }
CMBlTileTest >> tileOfOneColorPerSize [
	"Answer a tile with a large red form, a medium green one, a small blue one and a very small yellow one"

	^ self
		  tileWithLarge: (self solidForm: Color red)
		  medium: (self solidForm: Color green)
		  small: (self solidForm: Color blue)
		  verySmall: (self solidForm: Color yellow)
]

{ #category : 'private' }
CMBlTileTest >> tileWithLarge: largeForm medium: mediumForm small: smallForm verySmall: verySmallForm [

	^ CMTile new
		  instVarNamed: #largeForm put: largeForm;
		  instVarNamed: #mediumForm put: mediumForm;
		  instVarNamed: #smallForm put: smallForm;
		  instVarNamed: #verySmallForm put: verySmallForm;
		  yourself
]
