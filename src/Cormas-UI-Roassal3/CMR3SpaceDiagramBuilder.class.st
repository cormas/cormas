"
CMR3SpaceDiagramBuilder is the spatialGrid builder 
To get the real view, call #asPresenter (diagram := spaceBuilder asPresenter)
                                                                                                    
Examples
•	CMR3SpaceDiagramBuilder class>>#example
"
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
	| model |
	model := CMMockModel new. 
	model initFixed.

	(self for: model) asPresenter open
]

{ #category : 'instance creation' }
CMR3SpaceDiagramBuilder class >> for: aCormasModel [

	^ self new
		initializeWithCormasModel: aCormasModel;
		yourself
]

{ #category : 'accessing - pov' }
CMR3SpaceDiagramBuilder >> activeSpatialEntityPov [
	" Answer a <Symbol> representing the selector of the active PoV which is a Spatial Entity "
	
	^ cormasModel cellClass activePovSelector
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
CMR3SpaceDiagramBuilder >> cellsBuilder [

	^ cellsBuilder
]

{ #category : 'accessing' }
CMR3SpaceDiagramBuilder >> cellsBuilder: anObject [

	cellsBuilder := anObject
]

{ #category : 'accessing' }
CMR3SpaceDiagramBuilder >> cormasModel [

	^ cormasModel
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
CMR3SpaceDiagramBuilder >> initializeWithCormasModel: aModel [

	cormasModel := aModel.
	cellsBuilder := CMR3SpaceCellsBuilder for: self.
	agentsBuilder := CMR3SpaceAgentsBuilder for: self.
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

{ #category : 'enumerating' }
CMR3SpaceDiagramBuilder >> whenLeftClickOnCellDo: aBlock [

	cellsBuilder whenLeftClickDo: aBlock
]
