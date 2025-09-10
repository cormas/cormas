Class {
	#name : 'CMR3SpaceCellsBuilder',
	#superclass : 'CMR3SpaceShapeBuilder',
	#instVars : [
		'onLeftClickBlock'
	],
	#category : 'Cormas-UI-Roassal3-Space',
	#package : 'Cormas-UI-Roassal3',
	#tag : 'Space'
}

{ #category : 'accessing' }
CMR3SpaceCellsBuilder >> defaultMasterShape [
	"a RSBox, by default"

	^ diagramBuilder cormasModel spaceModel neighbourhoodConfiguration roassalMasterShape
		"size: 16;"
		yourself
]

{ #category : 'initialization' }
CMR3SpaceCellsBuilder >> initialize [

	super initialize.
	onLeftClickBlock := [ :cell | "do nothing" ]
]

{ #category : 'accessing' }
CMR3SpaceCellsBuilder >> masterShape: aShape [

	super masterShape: aShape.
	masterShape when: RSMouseLeftClick send: #processLeftClick: to: self
]

{ #category : 'accessing' }
CMR3SpaceCellsBuilder >> objects [

	^ diagramBuilder cormasModel cells
]

{ #category : 'enumerating' }
CMR3SpaceCellsBuilder >> processLeftClick: anEvent [

	| cell |
	cell := anEvent shape model.
	onLeftClickBlock value: cell
]

{ #category : 'rendering' }
CMR3SpaceCellsBuilder >> renderIn: aCanvas [

	super renderIn: aCanvas.

	"""RSGridLayout""
	RSCellLayout new
		gapSize: 0;
		lineItemsCount:
			diagramBuilder cormasModel spaceModel numberOfColumns;
		on: aCanvas nodes.

	diagramBuilder cormasModel spaceModel neighbourhoodConfiguration
		organizeShapesPositions: aCanvas nodes"
]

{ #category : 'as yet unclassified' }
CMR3SpaceCellsBuilder >> update [

	super update.
	
	"RSGridLayout"
	RSCellLayout new
		gapSize: 0;
		lineItemsCount:
			diagramBuilder cormasModel spaceModel numberOfColumns;
		on: shapes.

	diagramBuilder cormasModel spaceModel neighbourhoodConfiguration
		organizeShapesPositions: shapes
]

{ #category : 'updating' }
CMR3SpaceCellsBuilder >> updateShape: aShape [
"Set the PoV: Update shape and color of aShape"
	| cell pov extent border |
	cell := aShape model.

	pov := cell perform: diagramBuilder activeSpatialEntityPov.
	
	extent := aShape extent / aShape extent max * diagramBuilder maxExtent.
	aShape extent: extent.

	pov isForImage
		ifTrue: [ aShape paint: (self paintFromImage: (pov image scaledToSize: (extent max @ extent max))) ]
		ifFalse: [ aShape color: pov color ].
		
	border := RSBorder new
		color: pov borderColor;
		width: (aShape encompassingRectangle extent max * pov borderWidth);
		yourself.
		
	aShape border: border
]

{ #category : 'enumerating' }
CMR3SpaceCellsBuilder >> whenLeftClickDo: aBlock [

	onLeftClickBlock := aBlock
]
