Class {
	#name : 'CMSpacePresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'toolbar',
		'cormasModel',
		'povSelection',
		'diagram',
		'builder',
		'povButton',
		'isPovVisible'
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
		self update ]
]

{ #category : 'layout' }
CMSpacePresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: toolbar expand: false;
		add: (SpBoxLayout newLeftToRight
			spacing: 2;
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
	
	builder := CMR3SpaceDiagramBuilder new
		cormasModel: cormasModel.
	
	diagram := builder asPresenter.
		
	diagram owner: self.
	self update.
	
]

{ #category : 'initialization' }
CMSpacePresenter >> initializePresenters [

	isPovVisible := false.
	
	povButton := self newToolbarButton
		label: 'PoV';
		yourself.
		
	self updatePovButtonIcon.
		
	toolbar := self newToolbar
		addItemRight: povButton;
		yourself.

	povSelection := (self instantiate: CMPovSelectionPresenter on: cormasModel)
		whenChangedDo: [ builder update ];
		yourself.
		
	self updatePovSelectionVisibility.
		
	self initializeDiagram.
	self initializeCanvasInteractions
]

{ #category : 'accessing - model' }
CMSpacePresenter >> setModelBeforeInitialization: aCormasModel [
	
	cormasModel := aCormasModel 
]

{ #category : 'TOREMOVE' }
CMSpacePresenter >> updateDiagram [

	builder update
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
