Class {
	#name : #CMR3SpaceDiagramBuilder,
	#superclass : #RSAbstractContainerBuilder,
	#instVars : [
		'cormasModel',
		'cellShapes',
		'activePoVsDictionary',
		'agentShapes',
		'cellsBuilder',
		'agentsBuilder'
	],
	#category : #'Cormas-UI-Roassal3-Space'
}

{ #category : #examples }
CMR3SpaceDiagramBuilder class >> example [

	<example>
	| model builder |
	
	model := CMMockModel new
		initializeSimulation;
		yourself.

	builder := self new
		cormasModel: model;
		inspect;
		asPresenter.
	
	builder openWithSpec.
]

{ #category : #accessing }
CMR3SpaceDiagramBuilder >> agentShapes [

	^ agentsBuilder shapes
]

{ #category : #accessing }
CMR3SpaceDiagramBuilder >> cellShapes [

	^ cellsBuilder shapes
]

{ #category : #accessing }
CMR3SpaceDiagramBuilder >> cormasModel [

	^ cormasModel
]

{ #category : #accessing }
CMR3SpaceDiagramBuilder >> cormasModel: anObject [

	cormasModel := anObject
]

{ #category : #'as yet unclassified' }
CMR3SpaceDiagramBuilder >> defaultContainer [

	| canvas |
	canvas := RSCanvas new.
	canvas addInteraction: RSCanvasController.
	
	^ canvas
]

{ #category : #initialization }
CMR3SpaceDiagramBuilder >> initialize [

	super initialize.
	
	cellsBuilder := CMR3SpaceCellsBuilder for: self.
	agentsBuilder := CMR3SpaceAgentsBuilder for: self.
]

{ #category : #rendering }
CMR3SpaceDiagramBuilder >> renderIn: aCanvas [

	cellsBuilder renderIn: aCanvas.
	agentsBuilder renderIn: aCanvas.
]
