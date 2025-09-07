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
	
	| border |
	border := RSBorder new
		color: Color gray;
		width: 1;
		yourself.

	^ diagramBuilder cormasModel spaceModel neighbourhoodConfiguration roassalMasterShape
		size: 16;
		border: border;
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

	"RSGridLayout"
	RSCellLayout new
		gapSize: 0;
		lineItemsCount:
			diagramBuilder cormasModel spaceModel numberOfColumns;
		on: aCanvas nodes.

	diagramBuilder cormasModel spaceModel neighbourhoodConfiguration
		organizeShapesPositions: aCanvas nodes
]

{ #category : 'updating' }
CMR3SpaceCellsBuilder >> updateShape: aShape [
"Set the PoV: Update shape and color of aShape"
	| model pov |
	model := aShape model.

	pov := model perform: diagramBuilder activeSpatialEntityPov.

	pov isForImage
		ifTrue: [
			| newSize |
			newSize := pov image extent x.

			aShape
				paint: (self paintFromImage: pov image);
				size: newSize;
				scaleBy: 16 / aShape extent x ]
		ifFalse: [ aShape color: pov color ]
]

{ #category : 'enumerating' }
CMR3SpaceCellsBuilder >> whenLeftClickDo: aBlock [

	onLeftClickBlock := aBlock
]
