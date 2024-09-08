Class {
	#name : 'CMSimulationPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'modelClass',
		'initializer',
		'simulationRunner',
		'hideInitializationSettingButton',
		'isInitializerVisible'
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
CMSimulationPresenter >> beInNotRunningMode [

	initializer enabled: true
]

{ #category : 'as yet unclassified' }
CMSimulationPresenter >> beInRunningMode [

	initializer disableInitialization.
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

	initializer
		whenInitializedDo: [ simulationRunner simulation: initializer simulation ];
		beReinitializeCondition: [ simulationRunner hasSimulationData ].
		
	hideInitializationSettingButton action: [ 
		self updateInitializationSettingsVisibility ]
]

{ #category : 'layout' }
CMSimulationPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		spacing: 0;
		add: initializer width: 250;
		add: (SpBoxLayout newTopToBottom
			vAlignCenter;
			add: hideInitializationSettingButton height: 70;
			yourself) width: 25;
		add: simulationRunner;
		yourself
]

{ #category : 'as yet unclassified' }
CMSimulationPresenter >> hideInitializationSettings [

	isInitializerVisible := false.
	hideInitializationSettingButton icon: (self iconNamed: #overlayAdd).
	initializer hide.
	self update
]

{ #category : 'initialization' }
CMSimulationPresenter >> initializePresenters [
	
	isInitializerVisible := true.
	
	initializer := self
		instantiate: CMSimulationInitializerPresenter
		on: { modelClass . translator }.
		
	hideInitializationSettingButton := self newButton
		icon: (self iconNamed: #overlayRemove);
		yourself.
		
	simulationRunner := self
		instantiate: CMSimulationRunnerPresenter
		on: translator.
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
CMSimulationPresenter >> showInitializationSettings [

	isInitializerVisible := true.
	hideInitializationSettingButton icon: (self iconNamed: #overlayRemove).
	initializer show.
	self update.
]

{ #category : 'as yet unclassified' }
CMSimulationPresenter >> updateInitializationSettingsVisibility [

	isInitializerVisible
		ifTrue: [ self hideInitializationSettings ]
		ifFalse: [ self showInitializationSettings ]
]
