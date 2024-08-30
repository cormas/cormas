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
		label: 'Initialize simulation';
		icon: (self iconNamed: #smallNew);
		action: [ self initializeSimulation ];
		yourself.
		
	simulationRunner := self
		instantiate: CMSimulationRunnerPresenter
		on: translator.
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
		initialExtent: 800@500;
		whenResizingDo: [ simulationRunner fitDiagram ].
]

{ #category : 'accessing - model' }
CMSimulationPresenter >> setModelBeforeInitialization: aCollection [

	modelClass := aCollection first.
	translator := aCollection second
]
