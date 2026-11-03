Class {
	#name : 'CMR3SpaceDiagramBuilderTest',
	#superclass : 'TestCase',
	#instVars : [
		'fixture',
		'model',
		'builder',
		'presenter',
		'simulation'
	],
	#category : 'Cormas-UI-Tests-Core',
	#package : 'Cormas-UI-Tests',
	#tag : 'Core'
}

{ #category : 'private' }
CMR3SpaceDiagramBuilderTest >> assertSavesPngWith: aBlock [
	"Roassal exports through Cairo, which needs a path on the real disk, so a memory file system cannot be used here"

	| file |
	file := FileLocator temp
	        / ('cormas-space-' , UUID new asString , '.png').
	[
		aBlock value: file.
		self
			assert: (file binaryReadStream contents first: 4)
			equals: #[ 137 80 78 71 ] ] ensure: [ file ensureDelete ]
]

{ #category : 'private' }
CMR3SpaceDiagramBuilderTest >> newSpacePresenter [

	| application |
	application := CMSimulationApplication new.
	application cormasModel: model.
	^ application newPresenter: CMSpacePresenter
]

{ #category : 'initialization' }
CMR3SpaceDiagramBuilderTest >> setUp [
	
	super setUp.
	
	fixture := CMR3SpaceTestFixture new.
	
	model := fixture model.
	simulation := fixture simulation.
	
	builder := fixture builder.
	presenter := fixture presenter.
]

{ #category : 'as yet unclassified' }
CMR3SpaceDiagramBuilderTest >> testActiveSpatialEntityPovDefaultValue [

	self assert: builder activeSpatialEntityPov equals: #pov.
]

{ #category : 'as yet unclassified' }
CMR3SpaceDiagramBuilderTest >> testCormasModel [

	self assert: builder cormasModel equals: model.
]

{ #category : 'as yet unclassified' }
CMR3SpaceDiagramBuilderTest >> testInitialCellColors [
	
	| expectedColors actualColors |
	
	expectedColors := fixture initialCellColors.
	actualColors := builder cellShapes asOrderedCollection collect: [ :shape | shape color ].
	
	self assert: actualColors equals: expectedColors.
]

{ #category : 'as yet unclassified' }
CMR3SpaceDiagramBuilderTest >> testRandomSeedCells [

	"This test verifies that the random seed is fixed and the mock model is initialized with the expected combination of dead/alive cells."
	
	| expectedStates actualStates |
	
	expectedStates := fixture initialCellStates.
	actualStates := model cells collect: [ :cell | cell state ].
	
	self assert: actualStates equals: expectedStates.
]

{ #category : 'tests' }
CMR3SpaceDiagramBuilderTest >> testSaveToPngFile [

	self assertSavesPngWith: [ :file | builder saveToPngFile: file ]
]

{ #category : 'tests' }
CMR3SpaceDiagramBuilderTest >> testSpacePresenterSavesPngThroughItsBuilder [

	| spacePresenter |
	spacePresenter := self newSpacePresenter.

	self assertSavesPngWith: [ :file |
		spacePresenter saveToPngFile: file ]
]

{ #category : 'tests' }
CMR3SpaceDiagramBuilderTest >> testSpacePresenterSendsZoomToFitToItsBuilder [

	| spacePresenter camera |
	spacePresenter := self newSpacePresenter.
	camera := spacePresenter spaceBuilder container camera.
	camera
		scale: 100;
		translateTo: 1000 @ 1000.

	spacePresenter fitDiagram.

	self assert: camera scale < 100.
	self assert: camera position x < 1000
]

{ #category : 'as yet unclassified' }
CMR3SpaceDiagramBuilderTest >> testUpdateCellShapes [

	"Test if cell shapes are updated when model changes"
	
	| expectedColors actualColors |
	
	expectedColors := fixture updatedCellColors.
	
	simulation runStep.
	builder build.
	
	actualColors := builder cellShapes asOrderedCollection collect: [ :shape | shape color ].
	
	self assert: actualColors equals: expectedColors.
]

{ #category : 'tests' }
CMR3SpaceDiagramBuilderTest >> testZoomToFit [

	| camera |
	camera := builder container camera.
	camera
		scale: 100;
		translateTo: 1000 @ 1000.

	builder zoomToFit.

	self assert: camera scale < 100.
	self assert: camera position x < 1000
]
