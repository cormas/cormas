Class {
	#name : 'CMSpacePresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'toolbar',
		'cormasModel',
		'povSelection',
		'diagram',
		'povButton',
		'isPovVisible',
		'spaceBuilder'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'examples' }
CMSpacePresenter class >> example [
	<example>
	
	| simulation |
	
	simulation := (CMSimulation for: CMMockModel)
		activeInitSelector: #initFixed;
		activeControlSelector: #step:;
		initializeSimulation.
		
	"simulation := (CMSimulation for: ECECModel)
		activeInitSelector: #homogeneousEnvironment;
		activeControlSelector: #step:;
		initializeSimulation."
	
	(self on: simulation cormasModel) open
]

{ #category : 'initialization' }
CMSpacePresenter >> connectPresenters [

	povButton action: [
		isPovVisible := isPovVisible not.
		self updatePovSelectionVisibility.
		self updatePovButtonIcon.
		self update ].
]

{ #category : 'accessing' }
CMSpacePresenter >> cormasModel [

	^ cormasModel
]

{ #category : 'layout' }
CMSpacePresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: toolbar expand: false;
		add: (SpBoxLayout newLeftToRight
			spacing: 5;
			add: diagram;
			add: povSelection width: 200;
			yourself);
		yourself
]

{ #category : 'as yet unclassified' }
CMSpacePresenter >> fitDiagram [

	diagram canvas camera zoomToFit.
	diagram canvas signalUpdate
]

{ #category : 'as yet unclassified' }
CMSpacePresenter >> hideSettings [

	owner owner hideSettings
]

{ #category : 'initialization' }
CMSpacePresenter >> initializeCanvasInteractions [

	diagram canvas addInteraction: RSCanvasController new.
]

{ #category : 'initialization' }
CMSpacePresenter >> initializeDiagram [
	"Set the Grid presenter: a new instance of RoassalBuilder (CMR3SpaceDiagramBuilder)"

	spaceBuilder := CMR3SpaceDiagramBuilder for: cormasModel.
	diagram := spaceBuilder asPresenter.

	diagram owner: self.
	self update
]

{ #category : 'initialization' }
CMSpacePresenter >> initializePresenters [
"Set the Grid presenter (instance of RoassalBuilder (CMR3SpaceDiagramBuilder))"
	self initializeToolbar.
	
	povSelection := (self instantiate: CMPovSelectionPresenter on: cormasModel)
		whenChangedDo: [ spaceBuilder update ];
		yourself.
		
	self updatePovSelectionVisibility.
	self initializeDiagram.
	self initializeCanvasInteractions
]

{ #category : 'initialization' }
CMSpacePresenter >> initializeToolbar [

	isPovVisible := false.
	toolbar := self newToolbar.
	
	povButton := self newToolbarButton
		label: 'PoV';
		yourself.
		
	self updatePovButtonIcon.
	toolbar addItemRight: povButton.

	CMSpacePresenterCommand sortedSubclasses do: [ :aClass |
		| command |
		command := aClass forOwner: self translator: translator.
		toolbar add: command toolbarButton ].
]

{ #category : 'as yet unclassified' }
CMSpacePresenter >> saveCanvas: aRoassalCanvas toPngFile: aFileReference [

	RSPNGExporter new
		canvas: aRoassalCanvas;
		zoomToShapes;
		exportToFile: aFileReference
]

{ #category : 'as yet unclassified' }
CMSpacePresenter >> saveToPng [

	(StSaveFilePresenter extensions: {'png'})
		okAction: [ :fileReference | self saveToPngFile: fileReference ]
]

{ #category : 'as yet unclassified' }
CMSpacePresenter >> saveToPngFile: aFileReference [

	self
		saveCanvas: diagram canvas
		toPngFile: aFileReference
]

{ #category : 'accessing - model' }
CMSpacePresenter >> setModelBeforeInitialization: aCormasModel [
	
	cormasModel := aCormasModel 
]

{ #category : 'as yet unclassified' }
CMSpacePresenter >> showSettings [

	owner owner showSettings
]

{ #category : 'accessing' }
CMSpacePresenter >> spaceBuilder [

	^ spaceBuilder
]

{ #category : 'TOREMOVE' }
CMSpacePresenter >> updateDiagram [

	spaceBuilder update
]

{ #category : 'as yet unclassified' }
CMSpacePresenter >> updatePovButtonIcon [

	povButton icon: (isPovVisible
		ifTrue: [ CMIcons grayEyeIcon ]
		ifFalse: [ CMIcons eyeIcon ] )
]

{ #category : 'as yet unclassified' }
CMSpacePresenter >> updatePovSelectionVisibility [

	isPovVisible
		ifTrue: [ povSelection show ]
		ifFalse: [ povSelection hide ].
]
