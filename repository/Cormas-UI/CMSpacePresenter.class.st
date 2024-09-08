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
	
	"simulation := (CMSimulation for: CMMockModel)
		activeInitMethod: (CMMockModel >> #initFixed);
		activeControlMethod: (CMMockModel >> #step:);
		initializeSimulation."
		
	simulation := (CMSimulation for: ECECModel)
		activeInitMethod: (ECECModel >> #homogeneousEnvironment);
		activeControlMethod: (ECECModel >> #step:);
		initializeSimulation.
	
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

{ #category : 'initialization' }
CMSpacePresenter >> initializeCanvasInteractions [

	diagram canvas addInteraction: RSCanvasController new.
]

{ #category : 'initialization' }
CMSpacePresenter >> initializeDiagram [
	
	spaceBuilder := CMR3SpaceDiagramBuilder new
		cormasModel: cormasModel;
		whenLeftClickOnCellDo: [ :cell | self inform: cell asString ];
		yourself.
	
	diagram := spaceBuilder asPresenter.
		
	diagram owner: self.
	self update.
	
]

{ #category : 'initialization' }
CMSpacePresenter >> initializePresenters [

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
		toolbar add: command button ].
]

{ #category : 'as yet unclassified' }
CMSpacePresenter >> saveToPng [

	(StSaveFilePresenter extensions: {'png'})
		okAction: [ :fileReference | 
			RSPNGExporter new
				canvas: diagram canvas;
				exportToFile: fileReference ]
]

{ #category : 'accessing - model' }
CMSpacePresenter >> setModelBeforeInitialization: aCormasModel [
	
	cormasModel := aCormasModel 
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
