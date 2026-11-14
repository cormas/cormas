"
I check that cells and agents show the tiles of their look, by reading pixels.

## Responsibility:

- Check which form of a tile is used for each grid size.
- Check how a tile is fitted into a cell or an agent.
- Check that `update` follows a change between a tile and a color.

## Collaborators: 

- `CMTile`: I build tiles whose forms can be told apart by color.
- `CMBlTestCell` and `CMBlTestAgent`: entities whose look I choose.
"
Class {
	#name : 'CMBlTileTest',
	#superclass : 'CMBlTestCase',
	#category : 'Cormas-Bloc-Tests',
	#package : 'Cormas-Bloc-Tests'
}

{ #category : 'running' }
CMBlTileTest >> agentWithTile: aSymbol [

	^ (model newEntity: CMBlTestAgent)
		  aspect: [ :look |
				  look
					  tile: aSymbol;
					  shape: #square;
					  size: 1 ];
		  yourself
]

{ #category : 'running' }
CMBlTileTest >> cellWithTile: aSymbol rows: aNumber neighbourhood: aNeighbourhood [

	model := CMMockModel new.
	model cellClass: CMBlTestCell.
	model
		createGridNumberOfRows: aNumber
		numberOfColumns: 2
		neighbourhood: aNeighbourhood
		closed: true.
	model cells do: [ :each |
		each aspect: [ :look | look tile: aSymbol ] ].
	^ model cellAt: 1 at: 1
]

{ #category : 'tests' }
CMBlTileTest >> testAgentNotInAModelUsesTheLargeForm [

	| agent |
	model := CMMockModel new.
	agent := CMBlTestAgent new.
	agent aspect: [ :look |
			look
				tile: #oneColorPerSize;
				shape: #square;
				size: 1 ].
	self
		assert: (self hexColorIn: (CMBlAgentElement for: agent) at: 16 @ 16)
		equals: 'FF0000'
]

{ #category : 'tests' }
CMBlTileTest >> testAgentTileIsCutToTheShape [

	| agent element |
	self gridWithNeighbourhood: 4.
	agent := model newEntity: CMBlTestAgent.
	agent aspect: [ :look |
			look
				tile: #halfRedHalfBlue;
				shape: #circle;
				size: 1 ].
	element := CMBlAgentElement for: agent.
	self assert: (self hexColorIn: element at: 8 @ 16) equals: 'FF0000'.
	self assert: (self isTransparentIn: element at: 1 @ 1)
]

{ #category : 'tests' }
CMBlTileTest >> testAgentTileIsScaledToItsSize [

	| agent element |
	self gridWithNeighbourhood: 4.
	agent := model newEntity: CMBlTestAgent.
	agent aspect: [ :look |
			look
				tile: #halfRedHalfBlue;
				shape: #square;
				size: 0.5 ].
	element := CMBlAgentElement for: agent.
	self assert: (self hexColorIn: element at: 4 @ 8) equals: 'FF0000'.
	self assert: (self hexColorIn: element at: 12 @ 8) equals: '0000FF'
]

{ #category : 'tests' }
CMBlTileTest >> testAgentUsesTheFormForItsGridSize [

	| agent |
	self
		cellWithTile: #oneColorPerSize
		rows: 10
		neighbourhood: 4.
	agent := self agentWithTile: #oneColorPerSize.

	self
		assert: (self hexColorIn: (CMBlAgentElement for: agent) at: 16 @ 16)
		equals: '0000FF'
]

{ #category : 'tests' }
CMBlTileTest >> testCellShowsItsTile [

	| cell element |
	cell := self
		        cellWithTile: #halfRedHalfBlue
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
		        cellWithTile: #halfRedHalfBlue
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
		        cellWithTile: #oneColorPerSize
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
		        cellWithTile: #oneColorPerSize
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
		        cellWithTile: #oneColorPerSize
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
		        cellWithTile: #oneColorPerSize
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
		        cellWithTile: #halfRedHalfBlue
		        rows: 3
		        neighbourhood: #pointy6.

	element := CMBlCellElement for: cell.

	self assert: (self hexColorIn: element at: 12 @ 16) equals: 'FF0000'.
	self assert: (self hexColorIn: element at: 15 @ 16) equals: '0000FF'
]

{ #category : 'tests' }
CMBlTileTest >> testUpdateChangesFromColorToTile [

	| cell element |
	cell := self cellWithTile: #halfRedHalfBlue rows: 3 neighbourhood: 4.
	cell aspect: [ :look | look color: Color green ].
	element := CMBlCellElement for: cell.
	self assert: (self hexColorIn: element at: 8 @ 16) equals: '00FF00'.
	cell aspect: [ :look | look tile: #halfRedHalfBlue ].
	element update.
	self assert: (self hexColorIn: element at: 8 @ 16) equals: 'FF0000'
]

{ #category : 'tests' }
CMBlTileTest >> testUpdateChangesFromTileToColor [

	| cell element |
	cell := self cellWithTile: #halfRedHalfBlue rows: 3 neighbourhood: 4.
	element := CMBlCellElement for: cell.
	cell aspect: [ :look | look color: Color green ].
	element update.
	self assert: (self hexColorIn: element at: 8 @ 16) equals: '00FF00'
]
