Class {
	#name : 'CMSimulationPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'modelClass',
		'modelInitializationSettings',
		'initializeButton',
		'simulationRunner'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'examples' }
CMSimulationPresenter class >> example [
	<example>
	(self forModelClass: CMMockModel translator: CMEnglishTranslator new) open
]

{ #category : 'as yet unclassified' }
CMSimulationPresenter class >> forModelClass: aClass translator: aTranslator [

	^ self on: { aClass . aTranslator }
]

{ #category : 'as yet unclassified' }
CMSimulationPresenter >> confirmReinitialize [

	SpConfirmDialog new
		  title: 'Warning!';
		  label: (String streamContents: [ :stream |
				stream 
					nextPutAll: 'Are you sure you want to reinitialize the simulation?';
					cr;
					nextPutAll: 'Current simulation data will be lost' ]);
		  acceptLabel: 'Yes';
		  cancelLabel: 'No';
		  onAccept: [ self initializeSimulation ];
		  onCancel: [ "do nothing" ];
		  openModal
]

{ #category : 'initialization' }
CMSimulationPresenter >> connectPresenters [

	initializeButton action: [
		simulationRunner hasSimulationData
			ifFalse: [ self initializeSimulation ]
			ifTrue: [ self confirmReinitialize ].
			
		self updateInitializeButton ].
	
	modelInitializationSettings whenChangedDo: [
		modelInitializationSettings isDefined
			ifTrue: [ initializeButton enable ]
			ifFalse: [ initializeButton disable ] ].
]

{ #category : 'layout' }
CMSimulationPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		spacing: 15;
		add: (SpBoxLayout newTopToBottom
			spacing: 10;
			add: modelInitializationSettings;
			add: initializeButton height: self class buttonHeight;
			yourself) width: 250;
		add: simulationRunner;
		yourself
]

{ #category : 'initialization' }
CMSimulationPresenter >> initializePresenters [
	
	modelInitializationSettings := self
		instantiate: CMModelInitializationSettingsPresenter
		on: translator.
		
	modelInitializationSettings modelClass: modelClass.
	
	initializeButton := self newButton
		disable;
		yourself.
		
	simulationRunner := self
		instantiate: CMSimulationRunnerPresenter
		on: translator.
		
	self updateInitializeButton.
]

{ #category : 'initialization' }
CMSimulationPresenter >> initializeSimulation [

	simulationRunner simulation: ((CMSimulation for: modelClass)
		activeInitMethod: modelInitializationSettings initMethod;
		activeControlMethod: modelInitializationSettings controlMethod;
		initializeSimulation;
		yourself)
]

{ #category : 'initialization' }
CMSimulationPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	
	aWindowPresenter 
		title: 'Simulation';
		initialExtent: 1000@600;
		whenResizingDo: [ simulationRunner fitDiagram ].
]

{ #category : 'accessing - model' }
CMSimulationPresenter >> setModelBeforeInitialization: aCollection [

	modelClass := aCollection first.
	translator := aCollection second
]

{ #category : 'as yet unclassified' }
CMSimulationPresenter >> updateInitializeButton [

	simulationRunner hasSimulation
		ifTrue: [
			initializeButton
				label: 'Reinitialize simulation';
				icon: (self iconNamed: #glamorousRestart) ]
		ifFalse: [ 
			initializeButton
				label: 'Initialize simulation';
				icon: (self iconNamed: #smallNew) ]
]
