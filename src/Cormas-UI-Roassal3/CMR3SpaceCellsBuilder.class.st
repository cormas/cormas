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
	"^(RSPolygon new points: (RSPolygon generatePointsFitSquare: 6) * 50)"
| border |
border := RSBorder new
		color: (Color gray alpha: 0.5);
		yourself.
	^ RSBox new
		  size: 16;
			border: border;
		  yourself
]

{ #category : 'initialization' }
CMR3SpaceCellsBuilder >> initialize [

	super initialize.
	onLeftClickBlock := [ :cell | "do nothing" ].
]

{ #category : 'accessing' }
CMR3SpaceCellsBuilder >> masterShape: aShape [
	| border |
	border := RSBorder new
		          color: (Color gray alpha: 0.5);
		          yourself.
	aShape border: border.
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
"self halt."
	super renderIn: aCanvas.

	RSGridLayout new
		gapSize: 0;
		lineItemsCount:
			diagramBuilder cormasModel spaceModel numberOfColumns;
		on: aCanvas nodes
]

{ #category : 'initialization' }
CMR3SpaceCellsBuilder >> setMasterShape [
"Set masterShape, now that neighbourhoodConfiguration is knowned"
	self masterShape:
		diagramBuilder cormasModel spaceModel neighbourhoodConfiguration
			getMasterShape
	
]

{ #category : 'updating' }
CMR3SpaceCellsBuilder >> updateShape: aShape [

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
