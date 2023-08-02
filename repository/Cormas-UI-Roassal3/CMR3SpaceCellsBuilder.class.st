Class {
	#name : #CMR3SpaceCellsBuilder,
	#superclass : #CMR3SpaceShapeBuilder,
	#category : #'Cormas-UI-Roassal3-Space'
}

{ #category : #'as yet unclassified' }
CMR3SpaceCellsBuilder >> defaultMasterShape [

	^ RSBox new
		size: 25;
		yourself.
]

{ #category : #accessing }
CMR3SpaceCellsBuilder >> objects [

	^ diagramBuilder cormasModel theESE
]

{ #category : #rendering }
CMR3SpaceCellsBuilder >> renderIn: aCanvas [

	super renderIn: aCanvas.
	
	RSGridLayout new
		gapSize: 0;
		lineItemsCount: diagramBuilder cormasModel spaceModel column;
		on: aCanvas nodes.
]

{ #category : #updating }
CMR3SpaceCellsBuilder >> updateShape: aShape [

	| model colorSymbolOrNumber |
	model := aShape model.
	
	colorSymbolOrNumber := model perform: diagramBuilder activeSpatialEntityPov.

	aShape color: (colorSymbolOrNumber asColorForPoVIn: model).
]
