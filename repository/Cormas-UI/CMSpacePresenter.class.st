Class {
	#name : 'CMSpacePresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'cormasModel',
		'povSelection',
		'diagram',
		'builder'
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

{ #category : 'layout' }
CMSpacePresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		add: povSelection width: 200;
		add: diagram;
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

	povSelection := (self instantiate: CMPovSelectionPresenter on: cormasModel)
		whenChangedDo: [ builder update ];
		yourself.
		
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
