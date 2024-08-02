Class {
	#name : 'CMR3SpaceDiagramBuilder',
	#superclass : 'RSAbstractContainerBuilder',
	#instVars : [
		'cormasModel',
		'cellShapes',
		'activePoVsDictionary',
		'agentShapes',
		'cellsBuilder',
		'agentsBuilder'
	],
	#category : 'Cormas-UI-Roassal3-Space',
	#package : 'Cormas-UI-Roassal3',
	#tag : 'Space'
}

{ #category : 'examples' }
CMR3SpaceDiagramBuilder class >> example [

	<example>
	| model builder |
	
	model := CMMockModel new.

	builder := self new
		cormasModel: model;
		inspect;
		asPresenter.
	
	builder open.
]

{ #category : 'accessing' }
CMR3SpaceDiagramBuilder >> activePoVsDictionary [

	^ self cormasModel spaceModel activePoVsDictionary
]

{ #category : 'accessing - pov' }
CMR3SpaceDiagramBuilder >> activeSpatialEntityPov [
	" Answer a <Symbol> representing the selector of the active PoV which is a Spatial Entity "
	
	| spatialEntitySelections |
	
	spatialEntitySelections := self activePoVsDictionary associationsSelect: [ : assoc | assoc key isKindOf: CMSpatialEntityElement class ].
	^ spatialEntitySelections size = 1
		ifTrue: [ spatialEntitySelections anyOne value ]
		ifFalse: [ spatialEntitySelections ifEmpty: [ #pov ] ifNotEmpty: [ self error ] ]
]

{ #category : 'accessing' }
CMR3SpaceDiagramBuilder >> agentShapes [

	^ agentsBuilder shapes
]

{ #category : 'accessing' }
CMR3SpaceDiagramBuilder >> cellShapes [

	^ cellsBuilder shapes
]

{ #category : 'accessing' }
CMR3SpaceDiagramBuilder >> cormasModel [

	^ cormasModel
]

{ #category : 'accessing' }
CMR3SpaceDiagramBuilder >> cormasModel: anObject [

	cormasModel := anObject
]

{ #category : 'as yet unclassified' }
CMR3SpaceDiagramBuilder >> defaultContainer [

	| canvas interaction |
	canvas := RSCanvas new.
	
	interaction := RSCanvasController new.
	interaction noLegend.
	
	canvas addInteraction: interaction.
	
	^ canvas
]

{ #category : 'initialization' }
CMR3SpaceDiagramBuilder >> initialize [

	super initialize.
	
	cellsBuilder := CMR3SpaceCellsBuilder for: self.
	agentsBuilder := CMR3SpaceAgentsBuilder for: self.
]

{ #category : 'accessing' }
CMR3SpaceDiagramBuilder >> masterShapeForAgents: aShape [

	agentsBuilder masterShape: aShape
]

{ #category : 'accessing' }
CMR3SpaceDiagramBuilder >> masterShapeForCells: aShape [

	cellsBuilder masterShape: aShape
]

{ #category : 'rendering' }
CMR3SpaceDiagramBuilder >> renderIn: aCanvas [
	cellsBuilder renderIn: aCanvas.
	agentsBuilder renderIn: aCanvas.
]

{ #category : 'accessing' }
CMR3SpaceDiagramBuilder >> update [
	cellsBuilder update.
	agentsBuilder update.
	self container signalUpdate.
]
