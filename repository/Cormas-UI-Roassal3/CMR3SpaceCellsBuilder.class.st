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

{ #category : 'as yet unclassified' }
CMR3SpaceCellsBuilder >> defaultMasterShape [

	^ RSBox new
		size: 16;
		yourself.
]

{ #category : 'initialization' }
CMR3SpaceCellsBuilder >> initialize [

	super initialize.
	onLeftClickBlock := [ "do nothing" ]
]

{ #category : 'accessing' }
CMR3SpaceCellsBuilder >> masterShape: aShape [

	super masterShape: aShape.
	masterShape when: RSMouseLeftClick send: #processLeftClick: to: self.
]

{ #category : 'accessing' }
CMR3SpaceCellsBuilder >> objects [

	^ diagramBuilder cormasModel theCells
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
	
	RSGridLayout new
		gapSize: 0;
		lineItemsCount: diagramBuilder cormasModel spaceModel numberOfColumns;
		on: aCanvas nodes.
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
		ifFalse: [ aShape color: pov color ].
]

{ #category : 'enumerating' }
CMR3SpaceCellsBuilder >> whenLeftClickDo: aBlock [

	onLeftClickBlock := aBlock
]
